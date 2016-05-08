class Benefit < ActiveRecord::Base
  belongs_to :act
  validates_presence_of :description, :act_id
end
