class Admin::CommentsController < AdminController

 
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment].permit(:commenter, :body))
    @comment.post =@post
    if @comment.save
      redirect_to admin_post_path(@post)
    else
      render 'admin/posts/show'
    end
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to admin_post_path(@post)
  end
 
end