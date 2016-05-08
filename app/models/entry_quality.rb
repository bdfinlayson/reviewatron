class EntryQuality < ActiveRecord::Base
  belongs_to :entry
  belongs_to :quality
end
