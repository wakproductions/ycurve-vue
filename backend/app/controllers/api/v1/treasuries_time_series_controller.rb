module API
  module V1
    class TreasuriesTimeSeriesController < APIController

      API_FIELDS=[
        :treasury_datum_id,
        :yield_curve_date,
        :yield_1m,
        :yield_3m,
        :yield_6m,
        :yield_1y,
        :yield_2y,
        :yield_3y,
        :yield_5y,
        :yield_7y,
        :yield_10y,
        :yield_20y,
        :yield_30y,
      ]

      def show
        render json: time_series.to_json
      end

      private

      def time_series
        YieldCurveSnapshot.time_series(
          start_date: Date.parse(params[:start_date]),
          end_date: Date.parse(params[:end_date]),
          series: params[:series],
          data_density: 100
        )
      end

    end
  end
end