Rails.application.routes.draw do
  resources :users
  resources :articles

  root 'pages#home'
  get 'about', to: 'pages#about' #A get request to the "about page" handled by the pages controller
end


  #This gives all the restful routes for articles, comes with scaffold
  #can use :only to limit actions that are permitted to the resource: 
    #only: [:show, :index, :new, :create, :edit, :update, :destroy]