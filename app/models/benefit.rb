class Benefit < ActiveRecord::Base
  belongs_to :act
  validates_presence_of :description
end
