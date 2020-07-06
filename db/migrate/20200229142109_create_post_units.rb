class CreatePostUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :post_units do |t|
      t.references :post, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
