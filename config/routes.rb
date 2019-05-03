Rails.application.routes.draw do
  resources :powers
  resources :heroines
  post 'heroines/search', to: 'heroines#search'
end
