class Mover < ApplicationRecord
  belongs_to :moving_event, optional: true
  has_many :movees, through: :moving_event
  has_one :user, as: :meta, dependent: :destroy
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :user

  def full_name
    self.first_name + ' '+ self.last_name
  end
end
