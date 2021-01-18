class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :opinion
  validates :user_id, :opinion_id, :content, presence: true
  validates :content, length: { maximum: 50 }
end
