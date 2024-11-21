Rails.application.routes.draw do
  devise_for :users
  get 'search' => "searches#search"
  root 'top#index'
  get 'top/index'
  get 'reservations/index'
  get 'rooms/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'profile_edit'
    end
  end
  resources :rooms do
    collection do
      get 'own'
    end
  end
  resources :reservations do
    collection do
      post :confirm
    end
  end
end
