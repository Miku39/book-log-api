Rails.application.routes.draw do
  get 'welcome/index'
  resources :books, only: [:index, :show, :create] do
  end
  post 'slack', to: 'books#slack'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
