class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
 
 
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end


	private
  	
  def post_params
    params.require(:post).permit(:title, :text, :category_id)
  end


	
end
