Rails.application.routes.draw do
  resources :powers
  resources :heroines

  get '/search_index', to: 'heroines#search_index'
end
