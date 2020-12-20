Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'campaigns#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users

  resources :campaigns do
    resources :discussion_topics do
      resources :comments
    end
    resources :todos
    resources :comments
  end
end
