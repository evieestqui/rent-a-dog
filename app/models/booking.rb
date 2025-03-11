class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  enum status: { pending: "pending", accepted: "accepted", declined: "declined" }

  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_after_start_date
  validate :end_date_is_less_than_one_month

  private

  # Ensure start_date is not in the past
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  # Ensure end_date is after start_date
  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def end_date_is_less_than_one_month
    if start_date.present? && end_date.present? && end_date > start_date + 1.month
      errors.add(:end_date, "must be less the one month")
    end
  end
end
