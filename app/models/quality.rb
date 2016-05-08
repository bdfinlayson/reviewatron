class Quality < ActiveRecord::Base
  validates_presence_of :core_value_id, :assertion, :question
  belongs_to :core_value
  has_many :entry_qualities
  has_many :entries, through: :entry_qualities
end
