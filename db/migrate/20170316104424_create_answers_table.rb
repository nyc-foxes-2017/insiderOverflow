class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :response, null: false
      t.references :question
      t.references :user

      t.timestamps
    end
  end
end
