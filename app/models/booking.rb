class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :camp
  # validations
  validates :surfers, presence: true
  validates :start_day, presence: true
  validates :end_day, presence: true
end
