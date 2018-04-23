Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :news
    resources :campaigns do
      member do
        patch :publish
        patch :hold
        patch :close
      end
    end
  end
end
