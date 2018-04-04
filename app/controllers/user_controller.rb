class UserController < ApplicationController
	#==================== SIGNUP ==============================
	get '/signup' do
		if logged_in?
			redirect to "/goals"
		else
			erb :'/users/create_user'
		end
	end

	post '/signup' do
		@user = User.new(params)
		if @user.save
			session[:user_id] = @user.id
			flash[:signup] = "You've successfully signed up, #{@user.first_name}!"
			redirect to "/goals"
		else
			flash[:signup_error] = @user.errors.full_messages
			redirect to "/signup"
		end
	end
	#----------------------------------------------------------


	#==================== LOGIN ===============================
	get '/login' do
		if logged_in?
			redirect to "/goals"
		else
			erb :'/users/login'
		end
	end

	post '/login' do
		user = User.find_by(username: params[:username])
		
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:login] = "Successfully logged in!"
			redirect to "/goals"
		else
			redirect to "/signup"
		end
	end
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