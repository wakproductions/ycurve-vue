module API
  module V1
    class YieldCurveSnapshotsController < ActionController::API
      before_action :cors_set_access_control_headers # TODO put in abstract base class

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
        render json: snapshot(as_of_date).to_json
      end

      private

      def as_of_date
        if params[:date].present?

          # Offset parameter is used for getting the next/previous available Date
          if offset.nil? || offset == 0
            params[:date]
          elsif offset > 0
            # Get the next date
            YieldCurveSnapshot
              .where('yield_curve_date > ?', params[:date])
              .order(:yield_curve_date)
              .first
              .try(:yield_curve_date) || YieldCurveSnapshot.maximum(:yield_curve_date)
          elsif offset < 0
            # Get the previous date
            YieldCurveSnapshot
              .where('yield_curve_date < ?', params[:date])
              .order(yield_curve_date: :desc)
              .first
              .try(:yield_curve_date) || YieldCurveSnapshot.minimum(:yield_curve_date)
          end
          
        else
          YieldCurveSnapshot.maximum(:yield_curve_date)
        end
      end

      def snapshot(as_of_date)
        YieldCurveSnapshot
          .select(API_FIELDS)
          .where('yield_curve_date <= ?', as_of_date)
          .order(yield_curve_date: :desc)
          .limit(1)
          .to_a
          .map do |ycs|
            ycs_a = ycs.attributes
            ycs_a.keys.each do |key|
              ycs_a[key] = ycs_a[key].round(2) if ycs_a[key].is_a? Float
            end
            ycs_a
          end
      end

      private

      # TODO put in abstract base class
      def cors_set_access_control_headers
        response.set_header('Access-Control-Allow-Origin', '*')
        response.set_header('Access-Control-Allow-Methods', 'POST, PUT, DELETE, GET, OPTIONS')
        response.set_header('Access-Control-Request-Method', '*')
        response.set_header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization')
      end


      def offset
        params[:offset].to_i
      end

    end
  end
end