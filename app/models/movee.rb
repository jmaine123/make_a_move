class Movee < ApplicationRecord
  has_many :moving_events
  has_many :movers, through: :moving_events

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def location
    self.location_street + ', ' + self.location_city + ' '+ self.location_state
  end
end
