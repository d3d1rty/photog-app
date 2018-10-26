Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboard#show', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'public#index'
  end

  resources :users, controller: 'users', only: [:create] do
    resource :password, controller: 'clearance/passwords',
                        only: %i[create edit update]
  end

  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'sessions', only: %i[create new]

  get 'dashboard', to: 'dashboard#show', as: :dashboard
  root 'public#index'
end
