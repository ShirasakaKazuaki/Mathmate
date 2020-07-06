class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :response_id
      t.text    :content
      t.text    :rpimg
      t.timestamps
    end
  end
end
