Rails.application.routes.draw do
resources :categories
resources :accounts
resources :transactions
root 'pages#home'
end
