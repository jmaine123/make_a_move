class MovingEvent < ApplicationRecord
  has_many :movers
  has_one :movee
end
