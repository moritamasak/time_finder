Rails.application.routes.draw do
  resources :statuses
  root to: "home#index"
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
