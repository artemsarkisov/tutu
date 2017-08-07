Rails.application.routes.draw do
  resources :railway_stations

  get 'railway_stations/index'
end
