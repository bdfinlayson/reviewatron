class Challenge < ActiveRecord::Base
  belongs_to :act
  has_many :solutions
  validates_presence_of :description, :act_id
end
