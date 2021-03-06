class CoreValue < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :acts, through: :qualities
  has_many :qualities
end
