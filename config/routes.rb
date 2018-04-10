Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }
  end
end
