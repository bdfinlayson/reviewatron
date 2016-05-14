class AddSolutionToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :solution, :text
  end
end
