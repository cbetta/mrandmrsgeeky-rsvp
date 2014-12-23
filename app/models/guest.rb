class Guest < ActiveRecord::Base
  enum status: [ :confirmed, :cancelled ]

  validates :name, presence: true
  validates :email, presence: { unless: :cancelled? }, email: { unless: :cancelled? }
  validates :status, presence: true, inclusion: { in: Guest.statuses.keys }
  validates :plus_one_name, presence: { if: :has_plus_one }

  attr_accessor :plus_one

  private

  def has_plus_one
    plus_one.to_i == 1
  end
end
