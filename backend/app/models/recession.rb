class Recession < ApplicationRecord

  def self.add_recession_indicator_to_time_series(time_series)
    recessions = recessions_list
    chart_value = time_series.reduce(0) { |max,h| ([max] + h.except(:time_series_date).values).compact.max } + 1.0
    time_series.each do |ts|
      if recessions.find { |r| ts[:time_series_date] >= r[0] && ts[:time_series_date] <= r[1] }
        ts[:Recession] = chart_value
      else
        ts[:Recession] = 0
      end
    end
  end

  def self.recessions_list
    Recession.order(:begin_date).pluck(:begin_date, :end_date)
  end
end
