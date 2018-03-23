class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :entries
	validates_presence_of :name, :duration_in_days, :languages
	validates_uniqueness_of :name
end