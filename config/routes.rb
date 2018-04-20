Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :campaigns, :news, :users
    root 'users#index'
  end
end
