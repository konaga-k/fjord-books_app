# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :following_id, null: false
      t.integer :follower_id, null: false

      t.timestamps
    end

    add_index :relationships, :following_id
    add_index :relationships, %i[follower_id following_id], unique: true
  end
end
