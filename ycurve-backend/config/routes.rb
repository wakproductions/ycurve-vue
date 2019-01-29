Rails.application.routes.draw do
  # root 'home#index'

  namespace :api do
    namespace :v1 do
      get 'yield_curve_snapshot', to: 'yield_curve_snapshots#show'
    end
  end
end
