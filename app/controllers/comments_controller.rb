class CommentsController < ApplicationController

	http_basic_authenticate_with name: "ania", password: "blog", only: :destroy
 
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment].permit(:commenter, :body))
    @comment.post =@post
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
end