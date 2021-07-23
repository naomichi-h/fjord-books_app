class FixIndexRelationships < ActiveRecord::Migration[6.1]
  def change
    add_column :relationships, :following_user, :integer
    add_column :relationships, :followed_user, :integer
    remove_index :relationships, column: [:following_user, :followed_user]
    remove_column :relationships, :following_user
    remove_column :relationships, :followed_user
    add_index :relationships, [:following_user_id, :followed_user_id], unique: true
  end
end
