Rails.application.routes.draw do
  scope '(:locale)', locale: /en|uk/ do
    root 'campaigns#index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :campaigns, :news
    resources :users, only: %i[show index new edit update destroy]
    root 'users#index'
    post 'users/new', to: 'users#create'
    # patch '/users/:id/edit', to: 'users#update'
  end
end
