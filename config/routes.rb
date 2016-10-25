Rails.application.routes.draw do
  resources :grumbles do
    resources :comments
  end
  root to: redirect('/grumbles')
end
