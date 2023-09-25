Rails.application.routes.draw do
  resources :projects

  # Pages
  root "pages#home"
  get 'about', to:'pages#about'
  get 'testing', to: 'pages#testing_area'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
