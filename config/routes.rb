Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :grumbles, except: [:new, :edit] do
    resources :comments, except: [:new, :edit]
  end
  root to: redirect('/grumbles')
end
