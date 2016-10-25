Rails.application.routes.draw do
  resources :grumbles do
    resources :comments
  end
  resources :comments, only:  [:index]
  root to: redirect('/grumbles')
end
