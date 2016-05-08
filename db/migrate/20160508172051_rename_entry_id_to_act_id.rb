class RenameEntryIdToActId < ActiveRecord::Migration
  def change
  	rename_column :act_qualities, :entry_id, :act_id
  end
end
