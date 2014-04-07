class Station < ActiveRecord::Base
  validates :station_name, presence: true
  has_many :stops
  has_many :lines, through: :stops

def show_lines
  lines = Stop.where({station_id: self.id})
  lines = []
  stops.each do |stop|
    line = Line.find(stop.line_id)
    lines << line.line_number
  end
  lines
 end
end
