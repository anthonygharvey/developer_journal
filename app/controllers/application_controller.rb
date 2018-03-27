require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  #==================== CONFIGURATION =======================
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  #----------------------------------------------------------


  #==================== INDEX ===============================
  get '/' do
    if logged_in?
      redirect to "/goals"
    else
      redirect to "/login"
    end
  end
  #----------------------------------------------------------


  #==================== HELPERS =============================
  helpers do
    def current_user
      User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def new_goal(params)
      goal = current_user.goals.build(params)
      goal.start_date = Date.today
			goal.end_date = goal.start_date + goal.duration_in_days.days
      goal.progress = 0
      goal
    end

    def update_goal_progress
      current_user.goals.each do |goal|
        unique_entries = goal.entries.collect{|entry| entry.created_at.to_date}.uniq.count
        goal.progress = (unique_entries.to_f / goal.duration_in_days)*100
        goal.save
      end
    end

  end
  #----------------------------------------------------------

end