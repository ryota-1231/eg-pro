Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations", sessions: "users/sessions"  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users
  resources :images
  resources :progresses

  resources :curriculums do
    resources :drills do
      collection do
        get 'iframe'
        get 'frame'
      end
    end
  end

end
