Rails.application.routes.draw do
  root 'top#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    password: 'user/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :users do
    resource :followers, only: [:create, :destroy]
    get :bosses, on: :member
    get :subordinates, on: :member
  end

  resources :statuses do
    get :status_selection, on: :member
  end

  resources :conversations do
    resources :messages
  end
  
end
