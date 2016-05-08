class CreateEntryQualities < ActiveRecord::Migration
  def change
    create_table :entry_qualities do |t|
      t.integer :entry_id
      t.integer :quality_id

      t.timestamps null: false
    end
  end
end
