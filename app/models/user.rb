class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #associations
  has_many :camps, dependent: :destroy
  has_many :bookings, dependent: :destroy
  #validations

  mount_uploader :photo, PhotoUploader
end
