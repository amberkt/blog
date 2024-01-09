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

## Deploying to Heroku (Taken from Ruby on Rails Udemy Course)

You can sign-up for a heroku account at: https://www.heroku.com/

Preparation for production deployment:

- Remove sqlite3 gem from top of your Gemfile to within group :development, :test do block

Mine looks like below:

```
group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
```

- Create a group production ->

```
group :production do
  gem 'pg'
end
```

- Save Gemfile

- Run `bundle install --without production` to update Gemfile.lock file

- Commit your changes to git repo ->

`git add -A`

`git commit -m "Make app production ready"`

You can check if you already have Heroku CLI installed by going to your terminal and typing in:

`heroku --version`

or simply `heroku`

You can get the Heroku CLI from here: https://devcenter.heroku.com/articles/heroku-cli

Check Heroku installation:

`heroku --version`

`heroku #` for list of common heroku commands

Once installed, login to your Heroku account from your application directory:

`heroku login`

To create a new production version of your app hosted in Heroku, use the following command:

`heroku create`

To push your application code to Heroku and deploy your app, use the command below, but make sure all your code changes are committed by checking git status first (following the steps in the beginning of this text lecture) ->

`git push heroku master`

To change the name of your application ->

`heroku rename newnameofyourapp`

replace `newnameofyourapp` above with the name you'd like to give your app

Your app will then be accessible from the following browser URL ->

https://newnameofyourapp.herokuapp.com

## Resources

A resource includes a model, controller, a table, and views.
The model name is singular: "article."
The model file name will be `article.rb`
The article model class name will be "Article"
Rails will expect a corresponding table: "articles"

`rails generate scaffold Article title:string description:text`

This invoked active record, and created a migration file. It created a model, some tests, and routes. It generates a controller and views. This created an article resource with a string title and a text description.

When you use the scaffold generator in Ruby on Rails, it automatically generates a set of default actions for your controller, including the edit action. In the case of the edit action, the generator assumes that you will find the record to edit based on the id parameter in the URL.

Here's how it works:

In the config/routes.rb file, there's a route defined for the edit action, something like:

`resources :articles`

This line generates routes for all standard CRUD actions, including edit.

When you visit the URL for editing an article (e.g., /articles/1/edit), the Rails framework automatically calls the edit action in your controller.

Since the id parameter is present in the URL (params[:id]), Rails implicitly assumes that you want to find the corresponding record for that id.

The scaffold generator adds some default behavior behind the scenes. It assumes that the record will be found using the find method based on the id parameter.

```
def edit
  @article = Article.find(params[:id])
end
```

However, Rails is designed to be flexible, and it makes certain assumptions to save you from writing boilerplate code. If your scaffold-generated edit method doesn't explicitly include the @article = Article.find(params[:id]) line, it's because Rails is using its conventions to perform this operation implicitly.

This behavior works because the edit view typically forms a form for editing an existing record. Rails knows that for editing, it needs to retrieve the record based on the id parameter.

If the application works without explicitly fetching the article in the edit action, it suggests that Rails is able to infer the record based on the standard conventions and assumptions. However, keep in mind that explicit code can be added to the edit action if you need to customize or perform additional actions related to record retrieval.

## Routes

`rails routes` to see all routes in application, or `rails routes --expanded`

## Migrations

To create a migration file: `rails generate migration create_articles`

Rails will only run migration files that haven't been run already.

Need to run `rails db:migrate` to actually migrate the migration file.

Rollback the last migration file: `rails db:rollback`

Say you want to add a column to a table, you can't just go into the migration file and add the column and run the migration again. You should create a new migration file, this will be important in teams when you're working with multiple people. Say you want to add timestamps to a table:

```
class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
```

Save the file, and run `rails db:migrate` which will run the latest migration file.

By the way, when using the scaffold generator, Rails adds timestamps to tables when they are created. They include two columns: `created_at` and `updated_at`. These special columns are automatically managed by Active Record if they exist.

## Models

They inherit from ApplicationRecord:

```
class Article < ApplicationRecord
end
```

### Validations

    ```validates :title, presence: true #require title to be present to be saved to db
    validates :description, presence: true```

Requires title and description to not be blank before saving to db. To view any errors while saving an object, you can run `article.errors` or `articles.errors.full_messages`

## Rails Console

Can be accessed by `rails c` and you can get all articles with `Article.all`
Create another article: `Article.create(title: "another article", description: "this is a description of another article")`
Rails will take care of `created_at` and `updated_at`

It's preferred to use variables in the console.

`article4 = Article.new`
That creates an article with `nil` for title and description, and you can set and access the properties of article with `article4.title = something` and `article4.description = something`

This is not yet saved to the db! You need to run `article4.save`

In all one line:

```
article = Article.new(title: "another article", description: "this is a description of another article")
article.save
```

Finding a specific article by id, with id of 2: `Article.find(2)`
Finding the first article: `first_article = Article.first`
Last: `last_article = Article.last`

`reload!` reloads the console to reflect updated changes in the model file.

### Deleting an Article

```
article.destroy
```
