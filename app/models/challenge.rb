class Challenge < ActiveRecord::Base
  belongs_to :act
  validates_presence_of :problem
end
