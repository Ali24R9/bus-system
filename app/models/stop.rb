class Stop < ActiveRecord::Base
  belongs_to :lines
  belongs_to :stations
end
