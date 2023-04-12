Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users do
    resource :followers, only: [:create, :destroy]
    get :bosses, on: :member
    get :subordinates, on: :member
  end
  resources :statuses do
    member do
      get '/statuses/status_selection', to: 'statuses#status_selection'
    end
  end
  root to: "statuses#index"
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
