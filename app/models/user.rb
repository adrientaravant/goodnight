class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rooms, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name,
     message: "First and last names already taken" }
end
