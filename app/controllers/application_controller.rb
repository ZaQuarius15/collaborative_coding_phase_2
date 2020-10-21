class ApplicationController < ActionController::Base

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
      end

    def require_logged_in
      unless session.include? :user_id
      redirect_to controller: 'sessions', action: 'new'
      end
    end

end