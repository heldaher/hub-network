class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	
  	# has_secure_password
	has_many :posts
  
  has_many :group_users
  has_many :groups, :through => :group_users

  has_many :comments

  #add avatar (prof pic)
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  #validate added first and last name fields
  validates :firstname, presence: true
  validates :lastname, presence: true

  # Not used with devise I think
	# validates :username, :email, presence: true, uniqueness: true
	# validates :password, length: { minimum: 6 }
	# validates :email, format: { with: /\A\S+@\w+[.]\S+/, message: "is not a valid format." }

end
