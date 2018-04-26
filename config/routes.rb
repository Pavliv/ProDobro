Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :campaigns, :news
    resources :users, exept: :create
    root 'users#index'
    post 'users/new', to: 'users#create'
    # patch '/users/:id/edit', to: 'users#update'
  end
end
