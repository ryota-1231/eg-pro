Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'user#index'
  resources :user 
  resources :image
  resources :curriculum do
    collection do
      get 'iframe'
      get 'frame'
    end
  end

end
