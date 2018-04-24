Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :campaigns
    resources :news
  end
  resources :news do
    resources :comments
  end

  #root to: 'news#index'
end
