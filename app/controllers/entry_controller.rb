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
		if params[:new_goal]
			@entry = Entry.new(params[:entry])
			@entry.goal = new_goal(params[:new_goal])
		else
			@entry = current_user.entries.build(params[:entry])
		end
		
		if @entry.save
			update_goal_progress
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
	get '/entries' do
		@user = User.find_by(username: params[:username])
		@current_user = current_user
		if !logged_in?
			redirect to "/login"
		else
			erb :'/entries/entries'
		end
	end

	get '/entries/:entryid' do
		@entry = current_user.entries.find(params[:entryid])
		erb :'/entries/show'
	end
	#--------------------------------------------------------


	#==================== EDIT ==============================
	get '/entries/:entryid/edit' do
		@entry = current_user.entries.find(params[:entryid])
		erb :'/entries/edit_entry'
	end

	patch '/entries/:entryid' do
		if !(params[:entry][:goal_id] == "")
			entry = current_user.entries.find(params[:entryid])
			entry.update(params[:entry])
			flash[:edit_success] = "#{entry.title} Updated!"
			redirect to "/entries/#{params[:entryid]}"
		else
			@entry = current_user.entries.find(params[:entryid])
			@entry.update(params[:entry])
			flash[:edit_error] = @entry.errors.full_messages
			redirect to "/entries/#{params[:entryid]}/edit"
		end
	end
	#--------------------------------------------------------


	#==================== DELETE ============================
	delete '/entries/:entryid' do
		entry = current_user.entries.find(params[:entryid])
		flash[:delete_entry] = "#{entry.title} has been deleted"
		goal = entry.goal
		entry.delete
		update_goal_progress
		redirect to "/entries"
	end
	#--------------------------------------------------------

end