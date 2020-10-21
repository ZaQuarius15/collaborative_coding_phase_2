class ApplicationController < ActionController::Base

helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id])
      end

    def require_logged_in
      unless session.include? :user_id
      redirect_to controller: 'sessions', action: 'new'
      end
    end

end