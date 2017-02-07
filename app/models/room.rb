class Room < ApplicationRecord
  belongs_to :user
  validates :capacity, :city, :price, :title, :address, :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
