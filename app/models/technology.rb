# == Schema Information
#
# Table name: technologies
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_technologies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Technology < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  #画像投稿
  has_one_attached :image
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 4294967296 }
  
end
