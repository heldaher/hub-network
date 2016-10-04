class User < ApplicationRecord
  	has_secure_password
	has_many :posts

	validates :username, :email, presence: true, uniqueness: true
	validates :password, length: { minimum: 6 }
	validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "is not a valid format." }
end
