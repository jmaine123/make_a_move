class Mover < ApplicationRecord
  belongs_to :moving_event, optional: true
  has_many :movees, through: :moving_event

  def full_name
    self.first_name + ' '+ self.last_name
  end
end
