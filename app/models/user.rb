class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
end

# answer = Answer.find(params[:id])
# answer.comment << Comment.new(params[:comment])
