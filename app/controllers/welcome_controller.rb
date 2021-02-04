class WelcomeController < ApplicationController
  
  before_action :require_logged_in

  def home
  end

  def about
  end

end