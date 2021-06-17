class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, numericality: true
  
  mount_uploader :image, ImageUploader
end
