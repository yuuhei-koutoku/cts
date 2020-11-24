class Comment < ApplicationRecord
  belongs_to :technology
  validates :content, presence: true, length: { maximum: 255 }
end
