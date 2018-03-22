class Entry < ActiveRecord::Base
	belongs_to :goal
	validates_presence_of :title, :goal, :content


end