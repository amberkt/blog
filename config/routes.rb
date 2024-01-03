Rails.application.routes.draw do
  # root 'application#hello' 
  #send to the application controller, the hello action/method
  root 'pages#home'
  #this expects a home.html.erb template under the pages folder in views
end
