class Technology < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  #画像投稿
  has_one_attached :image
  
  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 255 }
  
end
