Rails.application.routes.draw do
  resources :articles
  root 'pages#home'
  get 'about', to: 'pages#about' #A get request to the "about page" handled by the pages controller
end
