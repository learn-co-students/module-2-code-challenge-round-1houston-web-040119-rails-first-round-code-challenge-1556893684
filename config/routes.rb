Rails.application.routes.draw do
  resources :powers
  resources :heroines 
  get 'search', to: 'heroines#search'
end
