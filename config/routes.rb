Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/users/profile', to: 'users#profile'

  root to: 'pages#home'

  get '/tagged', to: "summaries#tagged", as: :tagged

  # resources :articles

  resources :summaries
  #   member do
  #     post
  # end

end
