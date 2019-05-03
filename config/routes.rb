Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines
  post 'heroines/search', to: 'heroines#search'
end
