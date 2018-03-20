class User < ActiveRecord::Base
	has_secure_password
	has_many :goals
	has_many :entires, through: :goals
	validates_presence_of :username, :email, :password, :first_name, :last_name

end