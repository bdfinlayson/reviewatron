class Challenge < ActiveRecord::Base
  belongs_to :act
  has_one :solution
  validates_presence_of :description, :act_id
end
