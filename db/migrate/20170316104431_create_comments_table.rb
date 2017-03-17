class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :response
      t.references :user

      t.timestamps
    end
  end
end
