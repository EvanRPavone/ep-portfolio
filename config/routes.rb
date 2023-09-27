Rails.application.routes.draw do

  resources :projects do
    resources :comments
  end

  # Pages
  root "pages#home"
  get 'about', to:'pages#about'
  get 'testing', to: 'pages#testing_area'

  # Devise (User)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Profile
  get 'portfolio/:id', to: 'users#portfolio', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
