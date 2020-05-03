Rails.application.routes.draw do
  root                 to: 'pages#home'
  get    '/blog',      to: 'products#blog'
  get    '/signup',    to: 'users#new'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/list',      to:  'products#show'
  resources :users,  except: [:new]
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
