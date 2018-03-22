class User < ActiveRecord::Base
	has_secure_password
	has_many :goals
	has_many :entries, through: :goals
	validates_presence_of :username, :email, :password, :first_name, :last_name
	validates_uniqueness_of :username, :email
end