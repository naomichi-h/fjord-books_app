# frozen_string_literal: true

class ChangeRelationshipsToFollowings < ActiveRecord::Migration[6.1]
  def change
    rename_table :relationships, :followings
  end
end
