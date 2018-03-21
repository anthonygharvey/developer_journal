class UserController < ApplicationController
	#==================== SIGNUP ==============================
	get '/signup' do
		if logged_in?
			redirect to "/entries"
		else
			erb :'/users/create_user'
		end
	end

	post '/signup' do
		# binding.pry
		if valid_signup?
			@user = User.create(params)
			session[:user_id] = @user.id
			flash[:signup] = "You've successfully signed up, #{@user.first_name}!"
			redirect to "/entries"
		else
			redirect to "/signup"
		end
	end
	#----------------------------------------------------------


	#==================== LOGIN ===============================
	get '/login' do
		if logged_in?
			redirect to "/entries"
		else
			erb :'/users/login'
		end
	end

	post '/login' do
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:login] = "Successfully logged in!"
			redirect to "/entries"
		else
			redirect to "/signup"
		end
	end

	get '/entries' do
		@user = User.find_by(username: params[:username])
		@current_user = current_user
		if !logged_in?
			redirect to "/login"
		else
			erb :'/entries/entries'
		end
	end

	get '/:userid/entries' do

	end
	#---------------------------------------------------------


	#==================== USER SHOW PAGE =====================

	#---------------------------------------------------------


	#==================== LOGOUT =============================
	get '/logout' do
		if logged_in?
			session.clear
			redirect to "/login"
		else
			redirect to "/"
		end
	end
	#---------------------------------------------------------


end