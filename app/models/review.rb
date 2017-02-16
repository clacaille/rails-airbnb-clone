class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camp
  validates :title, :description, :rating, presence: true
  validates :rating, inclusion: {in: (1..5).to_a}
end
