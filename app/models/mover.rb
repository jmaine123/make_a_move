class Mover < ApplicationRecord
  before_save {self.email = email.downcase}
  belongs_to :moving_event, optional: true
  has_many :movees, through: :moving_event
  has_one :user, as: :meta, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :user

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present? and obj.location_city_changed?}

  def full_name
    self.first_name + ' '+ self.last_name
  end

  def location
    self.location_street + ', ' + self.location_city + ' '+ self.location_state
  end

  def full_address
    [self.location_street, self.location_city, self.location_state ].compact.join(', ')
  end
end
