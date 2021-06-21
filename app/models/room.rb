class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :room_name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :address, presence: true
  validates :image, presence: true

  def self.search(search)
    if self
      Room.where(['address LIKE ? OR description LIKE ? OR room_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end

  mount_uploader :image, ImageUploader
end
