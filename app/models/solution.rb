class Solution < ActiveRecord::Base
  belongs_to :problem
  validates_presence_of :description
end
