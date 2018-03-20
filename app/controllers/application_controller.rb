require './config/environment'

class ApplicationController < Sinatra::Base
#==================== CONFIGURATION =======================
configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions unless test?
  set :session_secret, "secret"
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
    !params.any?{|i| i[1].empty?}
  end

end
#----------------------------------------------------------


end
