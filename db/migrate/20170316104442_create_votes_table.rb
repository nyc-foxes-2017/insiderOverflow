class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  :votable_id
      t.integer :value, default: 0
      t.references :user, null: false

      t.timestamps
    end
  end
end
