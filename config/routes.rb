Rails.application.routes.draw do
  root to: "posts#main"
  resources :posts
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }
  #resources :users, :only => [:show] 
  post 'show/show'
  get 'show/show'

end
