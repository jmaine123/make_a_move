class MovingEvent < ApplicationRecord
  belongs_to :movee, optional: true
  belongs_to :mover, optional: true
end
