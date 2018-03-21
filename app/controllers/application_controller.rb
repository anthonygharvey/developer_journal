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
    erb :'index'
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

    def goal_exists?(goal_id)
      Goal.find_by_id(goal_id) != nil
    end

    def entry_exists?(entry_id)
      Entry.find_by_id(entry_id) != nil
    end

  end
  #----------------------------------------------------------

end