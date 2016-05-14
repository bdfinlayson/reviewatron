class RenameDecriptionToProblem < ActiveRecord::Migration
  def change
  	rename_column :challenges, :description, :problem
  end
end
