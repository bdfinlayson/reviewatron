class Entry < ActiveRecord::Base
  validates_presence_of :content, :user_id
  belongs_to :user
  has_many :core_values, through: :qualities
  has_many :entry_qualities
  has_many :qualities, through: :entry_qualities
end
