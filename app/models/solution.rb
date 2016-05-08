class Solution < ActiveRecord::Base
  belongs_to :challenge
  validates_presence_of :description, :challenge_id
end
