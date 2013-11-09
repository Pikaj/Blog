class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user, :foreign_key => :author_id
	has_many :comments, dependent: :destroy
    attr_accessible :title, :text, :category_id
end
