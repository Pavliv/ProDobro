Rails.application.routes.draw do

  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    post 'images' => 'images#create'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :campaigns
    resources :news
  end
end
