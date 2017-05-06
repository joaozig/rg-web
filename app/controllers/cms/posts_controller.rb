class Cms::PostsController < Cms::CmsController
  before_action :set_highlight
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /highlights/:highlight_id/posts
  def index
    @posts = @highlight.posts.all.order(:id)
  end

  # GET /highlights/:highlight_id/posts/1
  def show
  end

  # GET /highlights/:highlight_id/posts/new
  def new
    @post = Post.new
  end

  # GET /highlights/:highlight_id/posts/1/edit
  def edit
  end

  # POST /highlights/highlight_id/posts
  def create
    @post = Post.new(post_params)
    @post.highlight = @highlight

    respond_to do |format|
      if @post.save
        format.html { redirect_to cms_highlight_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highlights/:highlight_id/posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to cms_highlight_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highlights/:highlight_id/posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to cms_highlight_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_highlight
      @highlight = Highlight.find(params[:highlight_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {}).permit(
        :title, :headline, :content, :footnote,
        :franchise_id, :restaurant_id, :place_id)
    end
end
