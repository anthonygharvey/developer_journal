class Entry < ActiveRecord::Base
	belongs_to :goal
	validates_presence_of :title, :goal, :content

	def convert_to_date
		self.created_at.strftime("%A, %B %d, %Y")
	end

	def snippet
		if self.content.length > 100
			Sanitize.fragment(self.content)[0..100]+"..."
		else
			self.content
		end
	end

end