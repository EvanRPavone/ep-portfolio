Rails.application.routes.draw do

  # Pages
  root "pages#home"
  get 'about', to:'pages#about'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
