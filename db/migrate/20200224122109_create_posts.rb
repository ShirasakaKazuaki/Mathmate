class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :question
      t.string :question_img
      t.text :answer
      t.string :answer_img
      t.text  :content
      t.text  :supplement
      t.integer :likes_count
      t.integer :user_id
      t.integer :response_id

      t.timestamps
    end
  end
end
