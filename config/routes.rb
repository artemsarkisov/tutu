Rails.application.routes.draw do
  resources :trains do
    resources :waggons, shallow: true
  end
  resources :routes
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrival, on: :member
    patch :update_departure, on: :member
  end

  root 'railway_stations#index'
end
