class SessionsController < ApplicationController

  def new
  end

  def create
    if !params[:name] || params[:name].empty?
      flash[:error] = "Unsuccessful login. Please, try again."
      redirect_to(controller: 'sessions', action: 'new') 
    else user = User.find_by(:name => params[:name])
    session[:user_id] = user.id
      # #session should link with existing user
        redirect_to(controller: 'welecome', action: 'home')
    end
  end

  def destroy
    session.delete (:name)
    flash[:error] = "You have been logged-out"
    redirect_to controller: 'sessions', action: 'new'
  end
   




    # skip_before_action :verify_authenticity_token, only: :create

    # def create
    #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #     u.name = auth['info']['name']
    #     u.email = auth['info']['email']
    #     u.image = auth['info']['image']
    #   end
  
    #   session[:user_id] = @user.id
  
    #   render '/'
    # end
  
    # private
  
    # def auth
    #   request.env['omniauth.auth']
    # end

  end