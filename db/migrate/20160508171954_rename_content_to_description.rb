class RenameContentToDescription < ActiveRecord::Migration
  def change
  	rename_column :acts, :content, :description
  end
end
