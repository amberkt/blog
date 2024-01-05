Rails.application.routes.draw do
  resources :articles
  #This gives all the routes for articles, comes with scaffold but you'll need to manually add this here if you didn't use the scaffold
  #can use :only to limit actions that are permitted to the resource
  root 'pages#home'
  get 'about', to: 'pages#about' #A get request to the "about page" handled by the pages controller
end
