module API
  module V1
    class APIController < ActionController::API
      before_action :cors_set_access_control_headers if Rails.env.development?

      def cors_set_access_control_headers
        response.set_header('Access-Control-Allow-Origin', '*')
        response.set_header('Access-Control-Allow-Methods', 'POST, PUT, DELETE, GET, OPTIONS')
        response.set_header('Access-Control-Request-Method', '*')
        response.set_header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization')
      end
    end
  end
end
