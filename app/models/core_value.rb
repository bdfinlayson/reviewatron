class CoreValue < ActiveRecord::Base
  validates_presence_of :name
  has_many :entry_core_values
  has_many :entries, through: :entry_core_values
end
