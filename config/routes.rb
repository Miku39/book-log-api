Rails.application.routes.draw do
  get 'welcome/index'
  # get 'books/index'
  resources :books, only: [:index] do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'


end
