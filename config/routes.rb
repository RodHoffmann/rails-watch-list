Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'lists#home'
  get 'home', to: 'lists#home'
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
end
