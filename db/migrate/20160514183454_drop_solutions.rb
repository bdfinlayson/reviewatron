class DropSolutions < ActiveRecord::Migration
  def change
  	drop_table :solutions
  end
end
