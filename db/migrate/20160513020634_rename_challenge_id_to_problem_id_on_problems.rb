class RenameChallengeIdToProblemIdOnProblems < ActiveRecord::Migration
  def change
  	rename_column :solutions, :challenge_id, :problem_id
  end
end
