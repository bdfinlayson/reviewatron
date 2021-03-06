class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :acts
  has_many :qualities, through: :acts
  has_many :challenges, through: :acts
  has_many :benefits, through: :acts
end
