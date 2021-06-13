class AddDetailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :zip, :integer
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
