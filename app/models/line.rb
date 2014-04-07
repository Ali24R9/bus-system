class Line < ActiveRecord::Base
  validates :line_number, presence: true
  has_many :stops
  has_many :stations, through: :stops
end
