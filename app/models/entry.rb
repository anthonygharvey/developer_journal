class Entry < ActiveRecord::Base
	belongs_to :goal
	validates_presence_of :title, :goal, :content

	def convert_to_date
		self.created_at.strftime("%A, %B %d, %Y")
	end

end