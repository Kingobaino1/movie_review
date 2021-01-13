class User < ApplicationRecord
  has_many :opinions, dependent: :destroy
  has_many_attached :images
  has_many :active_followings, foreign_key: 'follower_id',
                               class_name: 'Following',
                               dependent: :destroy
  has_many :passive_followings, foreign_key: 'followed_id',
                                class_name: 'Following',
                                dependent: :destroy
  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :images, content_type: { in: %w[image/jpeg image/png image/png],
                                     message: 'Must be a valid image format' },
                     size: { less_than: 6.megabytes,
                             message: 'Should not exceed 5MB' }

  def follow(other_user)
    user.following.push(other_user)
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
