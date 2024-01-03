# README

## Create new application, first view, and first controller

Created new blog application using `rails new blog; cd blog`

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

## Setting up SSH Key

To display your public SSH key:

`cat ~/.ssh/id_rsa.pub`

If you don't have an SSH public key or are not sure, checkout the instructions here: https://help.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys

When creating a GitHub repo for your application, you can click on the SSH button, then push existing repo:

`git remote add origin git@github.com:yourgithubaccountname/<your-app-name>.git`

`git push -u origin master` # Remember you only need to use this command the first time

To view remotes setup in your environment (from your app directory):

`git remote -v`

For future pushes to repository:

`git push origin master`

## CSS Notes

|                       Selector name                        |                                               What does it select                                                |                                      Example                                      |
| :--------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------: |
| Element selector (sometimes called a tag or type selector) |                                     All HTML elements of the specified type.                                     |                                  p selects `<p>`                                  |
|                        ID selector                         |       The element on the page with the specified ID. On a given HTML page, each id value should be unique.       |                #my-id selects `<p id="my-id">` or `<a id="my-id"`>                |
|                       Class selector                       | The element(s) on the page with the specified class. Multiple instances of the same class can appear on a page.  |        .my-class selects `<p class="my-class"`> and `<a class="my-class"`>        |
|                     Attribute selector                     |                             The element(s) on the page with the specified attribute.                             |            img[src] selects `<img src="myimage.png">` but not `<img>`             |
|                   Pseudo-class selector                    | The specified element(s), but only when in the specified state. (For example, when a cursor hovers over a link.) | a:hover selects `<a>`, but only when the mouse pointer is hovering over the link. |

## Layout

CSS layout is mostly based on the box model. Each box taking up space on your page has properties like:

- `padding`, the space around the content. In the example below, it is the space around the paragraph text.
- `border`, the solid line that is just outside the padding.
- `margin`, the space around the outside of the border.

In this section we also use:

- `width` (of an element).
- `background-color`, the color behind an element's content and padding.
- `color`, the color of an element's content (usually text).
- `text-shadow` sets a drop shadow on the text inside an element.
- `display` sets the display mode of an element. (keep reading to learn more)
