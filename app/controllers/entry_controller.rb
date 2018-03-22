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
			flash[:new_entry] = "#{@entry.title} saved!"
			redirect to "/entries/#{@entry.id}"
		else
			flash[:entry_error] = @entry.errors.full_messages
			flash[:unsaved_title] = @entry.title
			flash[:unsaved_goal] = @entry.goal
			flash[:unsaved_content] = @entry.content
			redirect to "/entries/new"
		end
	end
	#--------------------------------------------------------


	#==================== SHOW ==============================
	get '/entries/:entryid' do
		@entry = Entry.find(params[:entryid])
		erb :'/entries/show'
	end
	#--------------------------------------------------------


	#==================== EDIT ==============================
	get '/entries/:entryid/edit' do
		@entry = Entry.find(params[:entryid])
		erb :'/entries/edit_entry'
	end

	patch '/entries/:entryid' do
		if !(params[:entry][:goal_id] == "")
			Entry.find(params[:entryid]).update(params[:entry])
			redirect to "/entries/#{params[:entryid]}"
		else
			@entry = Entry.find(params[:entryid])
			@entry.update(params[:entry])
			flash[:edit_error] = @entry.errors.full_messages
			redirect to "/entries/#{params[:entryid]}/edit"
		end
	end
	#--------------------------------------------------------


	#==================== DELETE ============================
	delete '/entries/:entryid' do
		entry = current_user.entries.find_by(params[:entryid])
		flash[:delete_entry] = "#{entry.title} has been deleted"
		entry.delete
		redirect to "/entries"
	end
	#--------------------------------------------------------

end