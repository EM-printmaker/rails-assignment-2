class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  #has_many :hotel_bills
  #has_many :rooms, through: :hotel_bills
  #accepts_nested_attributes_for :hotel_bills, allow_destroy: true
end
