Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'pages#home'

  get '/tagged', to: "summaries#tagged", as: :tagged

  # resources :articles

  resources :summaries
  #   member do
  #     post
  # end


end
