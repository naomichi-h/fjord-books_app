# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :relationships_of_following_users, class_name: 'Following', foreign_key: 'following_user_id', dependent: :destroy, inverse_of: :following_user
  has_many :following_users, through: :relationships_of_following_users, source: :followed_user

  has_many :relationships_of_followed_users, class_name: 'Following', foreign_key: 'followed_user_id', dependent: :destroy, inverse_of: :followed_user
  has_many :followed_users, through: :relationships_of_followed_users, source: :following_user

  # ユーザーをフォローする
  def follow(user_id)
    relationships_of_following_users.create(followed_user_id: user_id)
  end

  # すでにフォローしているか確認する
  def following?(user)
    following_users.include?(user)
  end
end
