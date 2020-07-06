class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :question_img, :qimg
    rename_column :posts, :answer_img, :aimg
  end
end
