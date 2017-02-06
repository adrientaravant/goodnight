class Room < ApplicationRecord
  belongs_to :user
  validates :capacity, :city, :price, :title, :address, :user_id, presence: true
end
