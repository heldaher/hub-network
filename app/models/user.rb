class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	
  	# has_secure_password
	has_many :posts

  # Not used with devise I think
	# validates :username, :email, presence: true, uniqueness: true
	# validates :password, length: { minimum: 6 }
	# validates :email, format: { with: /\A\S+@\w+[.]\S+/, message: "is not a valid format." }

end
