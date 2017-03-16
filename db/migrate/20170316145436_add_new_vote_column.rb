class AddNewVoteColumn < ActiveRecord::Migration
  def change
    add_column :votes, :votable_type , :string
  end
end
