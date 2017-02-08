class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :room, :user, :checkin, :checkout, :total_price,
             presence: true
end
