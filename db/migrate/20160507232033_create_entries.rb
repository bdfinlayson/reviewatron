class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
