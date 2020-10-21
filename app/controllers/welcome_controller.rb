class WelcomeController < ApplicationController
  
  before_action: require_logged_in

  def home
    raise session[:user_id].inspect
  end

end