Tw::Application.routes.draw do
  root to: "top#index"
  devise_for :users
  resource :users

  resources :mail_magazines do
    resources :magazine_targets
  end

  namespace :admin do
    root to: "top#index"

    resources :administrators
    # session controller
    # resource :session, only: [:cleate, :destroy]
    resource :session, only: [:create, :destroy]
    resources :users
  end
end
