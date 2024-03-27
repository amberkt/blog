class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  #This finds the article from the id in the params before the show, edit, update, and destroy actions 

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  #Remember that an instance variable will be available and passed down to the view

  def new
    @article = Article.new
  end

  def edit
  end

  # POST /articles or /articles.json

  #From the course
  # def create
  #   @article = Article.new(params.require(:article).permit(:title, :description))
  #   if @article.save
  #     redirect_to @article
  #   else 
  #     render 'new'
  # end


  #from scaffold
  def create
    @article = Article.new(article_params)
    @article.user = User.first 
    
    
    #Until we add authentication, I'm hardcoding in a user for each article that's created.
    #At the same time that I did this, I ran Article.update_all(user_id: User.first.id) to backfill each article with a user

    respond_to do |format|
      if @article.save
        flash[:notice] = "Article was created successfully, notification from flash notice"
        format.html { redirect_to article_url(@article), notice: "Article was created successfully, notification from scaffold" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  #to see the course code for update and edit as opposed to this generator code, see https://github.com/udemyrailscourse/alpha-blog-6/commit/a7b9797b08dbc7fc5272f459b3659b9df289e354

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Course code

  # def destroy
  #   @article = Article.find(params[:id])
  #   @article.destroy
  #   redirect_to articles_path
  # code on github here: https://github.com/udemyrailscourse/alpha-blog-6/commit/a1634510396abc38d049ba04e84368a397efe5ab
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through. Need to whitelist the keys in the params you want to permit.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
