class Technology < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  #画像投稿
  has_one_attached :image
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 4294967296 }
  
end
