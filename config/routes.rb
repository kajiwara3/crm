Tw::Application.routes.draw do
  root to: "top#index"
  devise_for :users
  resource :users

  resources :mail_magazines do
    member do
      get "test_sending", "target_csv_upload_form"
      post "target_csv_upload"
    end
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
