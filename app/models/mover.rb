class Mover < ApplicationRecord
  has_many :moving_events
  has_many :movees, through: :moving_events
end
