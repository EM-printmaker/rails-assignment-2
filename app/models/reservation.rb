class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  #has_many :hotel_bills
  #has_many :rooms, through: :hotel_bills
  #accepts_nested_attributes_for :hotel_bills, allow_destroy: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  
  validate :not_exceed_check_in_date

  def not_exceed_check_in_date
    unless check_in_date == nil || check_out_date == nil
      errors.add(:check_out_date, "はチェックイン以降の日付で選択してください。") if check_out_date <= check_in_date
    end
  end
end
