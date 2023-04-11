Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
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
