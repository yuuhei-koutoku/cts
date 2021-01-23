# == Schema Information
#
# Table name: comments
#
#  id            :bigint           not null, primary key
#  content       :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  technology_id :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_comments_on_technology_id  (technology_id)
#  index_comments_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (technology_id => technologies.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :technology
  validates :content, presence: true, length: { maximum: 255 }
end
