class Station < ActiveRecord::Base
  validates :station_name, presence: true
  has_many :lines, through: :stops
  has_many :stops
end
