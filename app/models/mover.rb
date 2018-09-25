class Mover < ApplicationRecord
  belongs_to :moving_event, optional: true
  has_many :movees 
end
