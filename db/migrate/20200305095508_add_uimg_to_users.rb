class AddUimgToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uimg, :string
  end
end
