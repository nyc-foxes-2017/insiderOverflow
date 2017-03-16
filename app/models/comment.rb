class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :response, presence: true
end
