class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :room_name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :address, presence: true
  validates :image, presence: true

  def self.search(search)
    if search
      Room.where(['address LIKE ?', "%#{search}%"])
    elsif
      Room.where(['description LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end

  mount_uploader :image, ImageUploader
end
