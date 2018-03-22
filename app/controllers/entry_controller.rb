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
		@entry = current_user.entries.build(params)
		if @entry.save
			# binding.pry
			flash[:new_entry] = "#{entry.title} saved!"
			redirect to "/entries/:entry_id"
		else
			flash[:entry_error] = @entry.errors.full_messages
			# binding.pry
			flash[:unsaved_title] = @entry.title
			flash[:unsaved_goal] = @entry.goal
			flash[:unsaved_content] = @entry.content
			redirect to "/entries/new"
		end
	end




		# TODO: uses the valid_entry? helper method.  Confirm the validates_presence_of method that can be added to a model generates an error message.
	#--------------------------------------------------------


end