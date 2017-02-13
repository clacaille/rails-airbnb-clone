class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :camp
  # validations
  validates :surfers, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
