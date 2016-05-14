class RenameProblemsToChallenges < ActiveRecord::Migration
  def change
  	rename_table :problems, :challenges
  end
end
