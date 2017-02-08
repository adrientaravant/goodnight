class Room < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :capacity, :city, :price, :title, :address, :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
