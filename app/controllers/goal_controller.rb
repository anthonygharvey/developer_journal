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
		@goal = new_goal
		if @goal.save
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
		erb :'/goals/index'
	end

	get '/goals/:goalid' do
		@goal = Goal.find(params[:goalid])
		update_goal_progress(@goal)
		erb :'/goals/show'
		# TODO: Create error message if a goal id doesn't exist.  Redirect back to /goals
	end
	#--------------------------------------------------------


	#==================== EDIT ==============================
	get '/goals/:goalid/edit' do
		@goal = Goal.find(params[:goalid])
		erb :'/goals/edit_goal'
	end

	patch '/goals/:goalid' do
		@goal = current_user.goals.find(params[:goalid])
		@goal.start_date = Date.today
		@goal.end_date = @goal.start_date + @goal.duration_in_days.days
		@goal.progress = 0
		if @goal.update(params[:goal])
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
	delete '/goals/:goalid' do
		goal = Goal.find(params[:goalid])
		flash[:goal_deleted] = "#{goal.name} has been deleted."
		goal.entries.each do |entry|
			entry.delete
		end
		goal.delete
		redirect to "/goals"
	end
	#--------------------------------------------------------
end