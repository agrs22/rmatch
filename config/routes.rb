Rails.application.routes.draw do
  resources :users
  resources :questions
  resources :instances
  # resources :topics
  match '/topics/start' => 'topics#start', via: [:get, :post]
  match '/topics' => 'topics#index', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
