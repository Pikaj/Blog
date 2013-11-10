class CreatePostService
  class EmptyTitleError < StandardError; end
  class EmptyPostError < StandardError; end
  class NoCategoryError< StandardError; end

  def process(author, params)
    raise EmptyTitleError.new unless !params[:title].empty?
    raise EmptyPostError.new unless !params[:text].empty?
    raise NoCategoryError.new unless !params[:category_id].empty?
  end 
end