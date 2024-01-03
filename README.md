# README

In order to preview the application, you will need to start the rails server. You can start the server by navigating to the terminal and typing in the following command from your application directory followed by enter/return:

`rails server`

You can also type `rails s` for short. Once the server starts you can open up a browser window and type in localhost:3000 to preview the app.

Back to the app, in order for the code to work there will need to be a pages controller and a home action within it.

Create a pages controller by navigating to the terminal/command line and typing in the following command from your application directory:

`rails generate controller pages`

There should now be a pages_controller.rb file under app/controllers folder.

Open up this file and add the home action to it with a rendering of 'Hello World!' like below:

```
def home
    render html: 'Hello World!'
end
```

Once you save this file and reload the browser preview, Hello World! should be displayed in the browser.

In order to do this the conventional way using views remove the code within the home action and leave it as an empty method/action like below:

```
def home
end
```

This will expect a home.html.erb template under the pages folder under views. This pages folder under the views folder was created when the pages controller was generated.

Within this app/views/pages folder, create a new file called home.html.erb and add in the following code inside the file:

Hello World!

Once you save this file and preview it from the browser, it should still say Hello World! as expected.
