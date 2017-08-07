Rails.application.routes.draw do
  resources :trains
  resources :railway_stations

  root 'railway_stations#index'
end
