class Opinion < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, :rating, :title, :genre, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: 'Must be a valid image format' },
                    size: { less_than: 6.megabytes,
                            message: 'Should not exceed 5MB' }
end

public

def blank_stars
  5 - rating.to_i
end

