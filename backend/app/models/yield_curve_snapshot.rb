class YieldCurveSnapshot < ApplicationRecord

  def self.time_series(start_date: Date.current - 3.years, end_date: Date.current, series: [], data_density: 100)
    # Gotta do this due to Chart.js performance issues - limit the numebr of datapoints returned
    mod = (datapoints.size / data_density).floor # use 1 to accept all datapoints

    YieldCurveSnapshot
      .where('yield_curve_date BETWEEN ? AND ?', start_date, end_date)
      .order(:yield_curve_date)
      .select.with_index { |_val, index| index % mod == 0 }
      .map { |snapshot| generate_time_series_fields(snapshot, series) }
      .reject { |r| r.except(:time_series_date).all?(&:nil?) }
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
