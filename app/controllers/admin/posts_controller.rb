class Admin::PostsController < AdminController

  require 'CreatePostService'

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end
 
  def create
    author = current_user
    begin
      @post = create_post_service.process(author, params[:post])
      flash[:notice] = "Create new post success"
      redirect_to admin_post_path(@post)
    rescue CreatePostService::EmptyTitleError
      flash[:notice] =  "Error: empty title"
      render 'admin/posts/new'
    rescue CreatePostService::EmptyPostError
      flash[:notice] =  "Error: empty post"
      render 'admin/posts/new'
    rescue CreatePostService::NoCategoryError
      flash[:notice] = "Please select the category."
      render 'admin/posts/new'
    end
  end
 
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :text, :category_id))
      redirect_to admin_post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to admin_posts_path
  end

	private
  def post_params
    params.require(:post).permit(:title, :text, :category_id)
  end

  def create_post_service
    CreatePostService.new()
  end
end