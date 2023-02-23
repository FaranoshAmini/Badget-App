Rails.application.routes.draw do
  devise_for :users

    authenticated :user do
      root 'groups#index'
      
    end
    resources :groups, only: [:index, :new, :create] do
      resources :expenses, only: [:index, :new, :create] 
    end
end
