class Category < ActiveRecord::Base
	has_many :posts
	validates :category, presence: true,
                    length: { minimum: 1 }
    attr_accessible :category
end
