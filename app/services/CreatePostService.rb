class CreatePostService
  class EmptyTitleError < StandardError; end
  class EmptyPostError < StandardError; end
  class NoCategoryError< StandardError; end
  class PostError < StandardError; end

  def process(post, author, params)
    raise EmptyTitleError.new unless !params[:title].empty?
    raise EmptyPostError.new unless !params[:text].empty?
    raise NoCategoryError.new unless !params[:category_id].empty?

    post.user = author
    render 'new' if !post.save
    raise PostError.new unless post.save
    post
  end 
end