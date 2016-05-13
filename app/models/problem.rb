class Problem < ActiveRecord::Base
  belongs_to :act
  has_many :solutions
  validates_presence_of :description
end
