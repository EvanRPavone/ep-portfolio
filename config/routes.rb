Rails.application.routes.draw do

  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/projects'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_project/:id', to: "admin#show_project", as: "admin_project"
  end

  get 'search', to: 'search#index'

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

  # Profile/Portfolio
  get 'p/:id', to: 'users#portfolio', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
