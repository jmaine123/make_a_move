class MovingEvent < ApplicationRecord
  has_many :movers, dependent: :nullify
  has_one :movee
  has_many :requests, dependent: :destroy
  has_many :giveaways, dependent: :destroy
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present?}

  def full_address
    [self.old_location_street, self.old_location_city, self.old_location_state ].compact.join(', ')
  end

  def new_full_address
    [self.new_location_street, self.new_location_city, self.new_location_state ].compact.join(', ')
  end

  def location
    self.old_location_street + ' ' + self.old_location_city + ' '+ self.old_location_state
  end

  def new_location
    self.new_location_street + ' ' + self.new_location_city + ' '+ self.new_location_state
  end

  def event_time
    self.start_time.hour + ':' + self.start_time.min
  end

  def format_time
    self.start_time = self.start_time.to_s.sub(/^(\d{1,2})(\d{2})$/,'\1:\2')
  end
end
