class Comment < ActiveRecord::Base
  	belongs_to :post
  	validates :commenter, presence: true,
                    length: { minimum: 1 }
  	validates :body, presence: true,
                    length: { minimum: 1 }
    attr_accessible :commenter, :body
end
