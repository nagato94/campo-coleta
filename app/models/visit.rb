class Visit < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :status, presence: true
  validates :checkin_at, presence: true
  validates :checkout_at, presence: true
  validate :check_dates

  private

  def check_dates
    errors.add(:date, 'must be in the future') if date.present? && date < Date.today
    errors.add(:checkout_at, 'must be after checkin_at') if checkin_at.present? && checkout_at.present? && checkout_at <= checkin_at
  end
end
