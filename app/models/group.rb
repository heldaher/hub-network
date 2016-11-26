class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  # has_many :posts, through: :users

  has_many :posts

  validates :name, presence: true
end
