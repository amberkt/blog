class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    #debugger
    #Need to find the article first, from the params
    # @article = Article.find(params[:id])
    set_article
  end

  #Remember that an instance variable will be available and passed down to the view

  def new
    @article = Article.new
  end

  def edit
    #Need to find the article first, from the params, to edit the article. This is from the course.
    #debugger
    set_article
    # @article = Article.find(params[:id])
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

    respond_to do |format|
      if @article.save
        flash[:notice] = "Article was created successfully, flash notice"
        format.html { redirect_to article_url(@article), notice: "Article was successfully created, scaffold." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    set_article #I added this, why doesn't the scaffold generator add this? Rails magic, see readme
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through. Need to whitelist the keys you want to permit.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
