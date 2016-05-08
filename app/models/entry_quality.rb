class EntryQuality < ActiveRecord::Base
  validates_presence_of :entry_id, :quality_id
  belongs_to :entry
  belongs_to :quality
end
