class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :description
      t.integer :act_id

      t.timestamps null: false
    end
    add_index :challenges, :act_id
  end
end
