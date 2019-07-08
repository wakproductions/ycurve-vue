Rails.application.routes.draw do
  # root 'home#index'

  namespace :api do
    namespace :v1 do
      get 'treasuries_time_series', to: 'treasuries_time_series#show'
      get 'yield_curve_snapshot', to: 'yield_curve_snapshots#show'
    end
  end
end
