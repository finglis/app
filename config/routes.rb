Rails.application.routes.draw do
  resources :line_items
  resources :stores

  root 'welcome#index'
  get "items/index"
  get "customers/index"
  get "articles/index"

  resources :items do
  end
  resources :customers do
  end
  resources :sales do
    get :request_finance
  end  
  resources :articles do
    resources :comments
  end 
end
