class Guest < ActiveRecord::Base
  enum status: [ "confirmed", "cancelled" ]

  validates :email, presence: true, email: true
  validates :state, presence: true, inclusion: { in: Guest.statuses.values }
end
