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
      erb :'/entries/entries'
    else
      erb :'index'
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

    def valid_signup?
      !params.any?{|i| i[1].empty?} && !User.find_by_username(params[:username]) && !User.find_by_email(params[:email])
    end

    def valid_entry?
      !params[:name].empty? && !params[:content].empty? && (!params[:goal_ids].empty? || !params[:new_goal].empty?)
    end

    def valid_goal?
      !(params[:goal] || params[:new_goal]).empty?
    end

    def goal_exists?(goal_id)
      Goal.find_by_id(goal_id) != nil
    end

    def entry_exists?(entry_id)
      Entry.find_by_id(entry_id) != nil
    end

    def new_goal
      goal = current_user.goals.build(params[:new_goal])
      goal.start_date = Date.today
			goal.end_date = goal.start_date + goal.duration_in_days.days
      goal.progress = 0
      goal
    end

    def update_goal_progress(goal)
      goal.progress = goal.entries.collect{|entry| entry.created_at.to_date}.uniq.count
      goal.save
    end

  end
  #----------------------------------------------------------

end