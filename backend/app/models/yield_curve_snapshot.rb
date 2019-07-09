class YieldCurveSnapshot < ApplicationRecord

  def self.time_series(
      start_date: Date.current - 3.years,
      end_date: Date.current,
      series: [],
      recession_indicator: false,
      data_density: 100
    )

    raw_datapoints = YieldCurveSnapshot
      .where('yield_curve_date BETWEEN ? AND ?', start_date, end_date)
      .order(:yield_curve_date)
      .to_a

    # Gotta do this due to Chart.js performance issues - limit the number of datapoints returned
    filtered_datapoints =
      if raw_datapoints.count <= data_density
        raw_datapoints
      else
        mod = (raw_datapoints.size / data_density).floor
        raw_datapoints.select.with_index { |_val, index| index % mod == 0 }
      end

    filtered_datapoints_with_time_series_fields =
      filtered_datapoints
      .map { |snapshot| generate_time_series_fields(snapshot, series) }
      .reject { |r| r.except(:time_series_date).all?(&:nil?) }

    if recession_indicator
      Recession.add_recession_indicator_to_time_series(filtered_datapoints_with_time_series_fields)
    else
      filtered_datapoints_with_time_series_fields
    end
  end

  private

  def self.generate_time_series_fields(snapshot, series)
    result = { time_series_date: snapshot.yield_curve_date }

    series.each do |series_id|
      if series_id =~ /\A\d{1,2}(Y|M)\z/ # 1M, 5Y, 10Y, etc.
        sym = "yield_#{series_id.downcase}"
        result[series_id] = snapshot.send(sym)
      elsif series_id =~ /\A(\d{1,2}[Y|M])-(\d{1,2}[Y|M])\z/ # comparison i.e. 10Y-1M
        syms = series_id.scan(/\A(\d{1,2}[Y|M])-(\d{1,2}[Y|M])\z/).first.map {|s| "yield_#{s.downcase}" }
        result[series_id] =
          if syms.any? { |sym| snapshot.send(sym).nil? }
            nil
          else
            (snapshot.send(syms[0]) - snapshot.send(syms[1])).round(2)
          end
      end
    end

    result
  end
end
