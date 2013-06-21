Metrix::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  devise_for :users

  resources :users
  resources :roles
  resources :servers do
    get 'import', :on => :member
  end
end