class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: {maximum: 50} 
  
  attr_accessor :current_password
  
  has_many :rooms
  has_many :reservations
  
  mount_uploader :image, ImageUploader
end
