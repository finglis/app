Rails.application.routes.draw do
  root "items#index"
  get "articles/index"

  resources :articles do
    resources :comments
  end
  resources :items do
  end
end
