class MovingEvent < ApplicationRecord
  has_many :movers
  has_one :movee

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present?}

  def full_address
    [self.old_location_street, self.old_location_city, self.old_location_state ].compact.join(', ')
  end

  def new_full_address
    [self.new_location_street, self.new_location_city, self.new_location_state ].compact.join(', ')
  end
end
