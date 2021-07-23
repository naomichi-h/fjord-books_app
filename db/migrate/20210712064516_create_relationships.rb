class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      t.references :following_user, foreign_key: {to_table: :users}, null: false
      t.references :followed_user, foreign_key: {to_table: :users}, null: false

      t.timestamps

      t.index [:following_user, :followed_user], unique: true
    end
  end
end
