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
	#--------------------------------------------------------


	#==================== EDIT ==============================
	#--------------------------------------------------------


	#==================== DELETE ============================
	#--------------------------------------------------------
end