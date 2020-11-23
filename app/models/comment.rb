class Comment < ApplicationRecord
  belongs_to :technology
  validates :content, presence: true, length: { maximum: 255 }
  validates :company, presence: true, length: { maximum: 25 }
  validates :name, presence: true, length: { maximum: 25 }
end
