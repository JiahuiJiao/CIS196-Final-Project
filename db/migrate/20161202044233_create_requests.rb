# Create Request table
class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :from, index: true, foreign_key: true
      t.references :to, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
