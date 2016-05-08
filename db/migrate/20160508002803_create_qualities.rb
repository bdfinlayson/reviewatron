class CreateQualities < ActiveRecord::Migration
  def change
    create_table :qualities do |t|
      t.integer :core_value_id
      t.string :assertion
      t.string :question

      t.timestamps null: false
    end
  end
end
