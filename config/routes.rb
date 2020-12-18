Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :campaigns do
    resources :discussion_topics
  end
    
  resources :users
  resources :comments
  resources :todos
  resources :discussion_topics
end
