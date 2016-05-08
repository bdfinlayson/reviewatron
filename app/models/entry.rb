class Entry < ActiveRecord::Base
  validates_presence_of :content, :user_id
  belongs_to :user
  has_many :entry_core_values
  has_many :core_values, through: :entry_core_values
  has_many :entry_qualities
  has_many :qualities, through: :entry_qualities
end
