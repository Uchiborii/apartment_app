Rails.application.routes.draw do
  root 'apartments#new'

  resources :stations, only: [:new, :create, :show, :edit, :update]
  resources :apartments do
    collection do
      post :confirm
    end
  end
end
