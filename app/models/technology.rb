class Technology < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :company, presence: true, length: { maximum: 25 }
  validates :name, presence: true, length: { maximum: 25 }
end
