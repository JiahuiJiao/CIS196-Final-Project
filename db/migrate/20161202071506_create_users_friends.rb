# Create UsersFriends Table
class CreateUsersFriends < ActiveRecord::Migration
  def change
    create_table :users_friends do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
