Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/about", to: "pages#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: [:index, :show, :create]
  resources :timelines, only: [:index, :show] 
  resources :saved_articles, only: [:create]

end
