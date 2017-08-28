Rails.application.routes.draw do
  resources :trains
  resources :routes
  resources :railway_stations
  resources :waggons

  root 'railway_stations#index'
end
