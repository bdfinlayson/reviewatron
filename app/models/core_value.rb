class CoreValue < ActiveRecord::Base
  validates_presence_of :name
  has_many :entries, through: :qualities
  has_many :qualities
end
