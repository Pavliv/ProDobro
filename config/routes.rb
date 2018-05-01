Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    devise_for :users, controllers: { registrations: 'users/registrations' }

    resources :news do
      resources :comments, only: %i[create edit update destroy]
    end
    resources :campaigns do
      resources :comments, only: %i[create edit update destroy]
    end
  end
end
