class Act < ActiveRecord::Base
  validates_presence_of :description, :user_id
  belongs_to :user
  has_many :core_values, through: :qualities
  has_many :act_qualities
  has_many :qualities, through: :act_qualities
end
