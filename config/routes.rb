Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  resources :products do
    resources :orders, except: %i[index show destroy]
  end

  resources :orders, only: %i[index show destroy]

  resources :employees do
    get 'search', on: :collection
  end
end
