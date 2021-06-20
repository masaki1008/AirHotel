class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :room_name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :address, presence: true
  validates :image, presence: true


  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Project.where(['name LIKE ?', "%#{search}%"])
    else
      Project.all #全て表示。
    end
  end

  mount_uploader :image, ImageUploader
end
