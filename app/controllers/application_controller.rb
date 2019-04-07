class ApplicationController < ActionController::Base

before_action :set_current_user

def set_current_user
	@current_user = User.find_by(id: session[:user_id])
end

def auth_user
	if @current_user == nil
		flash[:notice] = "ログインが必須です！"
		redirect_to("/login")
	end
end

def login_user
	if @current_user
		flash[:notice] = "すでにログインしています！"
		redirect_to("/posts/index")
	end
end



end
