class RenameEntriesToActs < ActiveRecord::Migration
  def change
  	rename_table :entries, :acts
  end
end
