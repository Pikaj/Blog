class Post < ActiveRecord::Base
	belongs_to :category
	has_many :comments, dependent: :destroy
	validates :text, presence: true,
                    length: { minimum: 5 }
	validates :title, presence: true,
                    length: { minimum: 5 }
end
