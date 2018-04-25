Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :news do
      resources :comments
    end
    resources :campaigns do
      resources :comments
    end
  end
end
