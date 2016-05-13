class RenameChallengeToProblem < ActiveRecord::Migration
  def change
  	rename_table :challenges, :problems
  end
end
