class Movee < ApplicationRecord
  has_many :moving_events
  has_many :movers
end
