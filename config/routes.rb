Rails.application.routes.draw do
  resources :statuses
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
