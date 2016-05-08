class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.text :description
      t.integer :act_id

      t.timestamps null: false
    end
    add_index :benefits, :act_id
  end
end
