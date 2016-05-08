class Challenge < ActiveRecord::Base
  belongs_to :act
  has_one :solution
end
