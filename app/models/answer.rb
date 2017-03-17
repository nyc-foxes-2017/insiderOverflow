class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :response, :question_id, :user_id, presence: true


  def points
    votes.sum(:value)
  end


end
