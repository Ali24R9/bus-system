class Line < ActiveRecord::Base
  validates :line_number, presence: true
  has_many :stops
  has_many :stations, through: :stops

  def show_lines
    stops = Stop.where({line_id: self.id})
    stations = []
    stops.each do |stop|
      station = Station.find(stop.station_id)
      stations << station.station_name
    end
    stations
  end
end
