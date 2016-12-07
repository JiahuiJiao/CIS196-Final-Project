# Create the User table with name, password, and email
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_hash
      t.string :email

      t.timestamps null: false
    end
  end
end
