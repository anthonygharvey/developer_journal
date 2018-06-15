class GoalController < ApplicationController
	#==================== NEW ===============================
	get '/goals/new' do
		if logged_in?
			erb :'/goals/create_goal'
		else
			redirect to "/login"
			# TODO: Create a flash message asking the user to login first to view the page
		end
	end

	post '/goals' do
		@goal = new_goal(params[:goal])
		if @goal.valid?
			@goal.start_date = Date.today
			@goal.end_date = @goal.start_date + @goal.duration_in_days.days
			@goal.progress = 0
			@goal.save
			flash[:new_goal] = "#{@goal.name} was saved!"
			redirect to "/goals/#{@goal.id}"
		else
			flash[:goal_error] = @goal.errors.full_messages
			flash[:unsaved_name] = @goal.name
			flash[:unsaved_days] = @goal.duration_in_days
			flash[:unsaved_languages] = @goal.languages
			redirect to "/goals/new"
		end
	end
	#--------------------------------------------------------


	#==================== SHOW ==============================
	get '/goals' do
		@user = current_user
		update_goal_progress
		erb :'/goals/index'
	end

	get '/goals/:id' do
		if current_user.goals.find_by(id: params[:id]) != nil
			@goal = current_user.goals.find_by(id: params[:id])
			update_goal_progress
			erb :'/goals/show'
		else
			@user = current_user
			flash[:no_goal_error] = "A goal with an id of #{params[:id]} does not exist for #{@current_user.first_name}."
			redirect to '/goals'
		end
	end
	#--------------------------------------------------------


	#==================== EDIT ==============================
	get '/goals/:id/edit' do
		@goal = current_user.goals.find(params[:id])
		update_goal_progress
		erb :'/goals/edit_goal'
	end

	patch '/goals/:id' do
		@goal = current_user.goals.find(params[:id])
		@goal.start_date = Date.today
		@goal.end_date = @goal.start_date + @goal.duration_in_days.days
		# @goal.progress = 0
		if @goal.update(params[:goal])
			update_goal_progress
			flash[:goal_updated] = "#{@goal.name} was updated!"
			redirect to "/goals/#{@goal.id}"
		else
			flash[:goal_error] = @goal.errors.full_messages
			flash[:unsaved_name] = @goal.name
			flash[:unsaved_days] = @goal.duration_in_days
			flash[:unsaved_languages] = @goal.languages
			redirect to "/goals/#{@goal.id}/edit"
		end
	end
	#--------------------------------------------------------


	#==================== DELETE ============================
	delete '/goals/:id' do
		goal = current_user.goals.find(params[:id])
		flash[:goal_deleted] = "#{goal.name} has been deleted."
		goal.entries.each do |entry|
			entry.delete
		end
		goal.delete
		redirect to "/goals"
	end
	#--------------------------------------------------------
end