# README

Notes

###Config/Routes

`root 'application#hello'`

This will be sent to the application controller, the hello action/method

`root 'pages#home'`

This expects a home.html.erb template under the pages folder in views. The `def home` method/action will then look for home.html.erb under layouts/pages

###Generating new controllers

`rails generate controller pages`
