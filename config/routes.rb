Rails.application.routes.draw do
  get 'welcome/index'
  resources :books, only: [:index, :show, :create, :destroy] do
  end
  post 'show_via_slack', to: 'books#show_via_slack'
  post 'create_via_slack', to: 'books#create_via_slack'
  post 'destroy_via_slack', to: 'books#destroy_via_slack'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
