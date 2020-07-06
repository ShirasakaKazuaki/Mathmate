class CreateCategoryUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :category_units do |t|
      t.references :unit, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
