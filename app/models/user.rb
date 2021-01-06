class User < ApplicationRecord
  has_many :opinions
  has_many :active_followings, foreign_key: 'follower_id',
                               class_name: 'Following',
                               dependent: :destroy
  has_many :passive_followings, foreign_key: 'followed_id',
                                class_name: 'Following',
                                dependent: :destroy
  has_many :following, through: :active_followings, source: :followed
  has_many :follower, through: :passive_followings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
