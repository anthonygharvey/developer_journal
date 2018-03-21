class EntryController < ApplicationController
	#==================== NEW ===============================
	get '/entries/new' do
		if logged_in?
			erb :'/entries/create_entry'
		else
			redirect to "/login"
		end
	end

	post '/entries' do
		binding.pry
		# TODO: uses the valid_entry? helper method.  Confirm if the validates_presence_of method that can be added to a model generates an error message.
	end
	#--------------------------------------------------------


end