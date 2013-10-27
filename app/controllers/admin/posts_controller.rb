class Admin::PostsController < AdminController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end
 
  def create
    @post = Post.new(params[:post].permit(:title, :text, :category_id))
 
    if @post.save
      redirect_to admin_post_path(@post)
    else
      render 'new'
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


end