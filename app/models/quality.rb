class Quality < ActiveRecord::Base
  validates_presence_of :core_value_id, :assertion, :question
  belongs_to :core_value
  has_many :act_qualities
  has_many :acts, through: :act_qualities
end
