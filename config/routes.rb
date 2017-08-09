Rails.application.routes.draw do
  resources :trains
  resources :routes
  resources :railway_stations

  root 'railway_stations#index'
end
