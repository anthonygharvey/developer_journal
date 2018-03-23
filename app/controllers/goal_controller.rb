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
		@goal = current_user.goals.build(params[:goal])
		@goal.start_date = Time.now
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
	get '/goals/:goalid' do
		@goal = Goal.find(params[:goalid])
		erb :'/goals/show'
		# TODO: Create error message if a goal id doesn't exist.  Redirect back to /goals
	end
	#--------------------------------------------------------


	#==================== EDIT ==============================
	#--------------------------------------------------------


	#==================== DELETE ============================
	#--------------------------------------------------------
end