# frozen_string_literal: true

class AddDetailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :zip, :integer, null: false, default: ''
    add_column :users, :address, :string, null: false, default: ''
    add_column :users, :profile, :text, null: false, default: ''
  end
end
