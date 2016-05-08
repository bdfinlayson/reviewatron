class CreateEntryCoreValues < ActiveRecord::Migration
  def change
    create_table :entry_core_values do |t|
      t.integer :entry_id
      t.integer :core_value_id

      t.timestamps null: false
    end
  end
end
