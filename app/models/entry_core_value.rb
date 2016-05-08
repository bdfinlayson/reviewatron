class EntryCoreValue < ActiveRecord::Base
  validates_presence_of :entry_id, :core_value_id
  belongs_to :entry
  belongs_to :core_value
end
