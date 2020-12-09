Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: 'overrides/registrations' }
  resources :campaigns
  resources :users
end
