class Request < ApplicationRecord
  belongs_to :mover
  belongs_to :moving_event
end
