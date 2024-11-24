class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  
  validate :not_exceed_check_in_date
  validate :date_before_start

  def not_exceed_check_in_date
    unless check_in_date == nil || check_out_date == nil
      errors.add(:check_out_date, "はチェックイン以降の日付で選択してください。") if check_out_date <= check_in_date
    end
  end

  def date_before_start
    return if check_in_date.blank?
      errors.add(:check_in_date, "は本日以降の日付で選択してください。") if check_in_date <= Time.zone.today
  end
end
