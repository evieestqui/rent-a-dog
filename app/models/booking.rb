class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  enum status: { pending: "pending", accepted: "accepted", declined: "declined" }
end
