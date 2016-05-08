class RenameEntryQualitiesToActQualities < ActiveRecord::Migration
  def change
  	rename_table :entry_qualities, :act_qualities
  end
end
