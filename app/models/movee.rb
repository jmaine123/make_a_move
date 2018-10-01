class Movee < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :moving_events
  has_many :movers, through: :moving_events
  has_one :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def location
    self.location_street + ', ' + self.location_city + ' '+ self.location_state
  end
end
