class DropEntryCoreValues < ActiveRecord::Migration
  def change
  	drop_table :entry_core_values
  end
end
