class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  validates :title, :body, :user_id, presence: true
end
