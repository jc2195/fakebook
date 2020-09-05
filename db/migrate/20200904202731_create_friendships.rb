class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships, {:id => false} do |t|
      t.integer :friend1_id
      t.integer :friend2_id

      t.timestamps
    end
  end
end
