Rails.application.routes.draw do
  get 'welcome/index'
  # get 'books/index'
  # get '/books/:id', to: 'books#show'
  resources :books, only: [:index, :show] do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'


end
