class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :description
      t.integer :challenge_id

      t.timestamps null: false
    end
    add_index :solutions, :challenge_id
  end
end
