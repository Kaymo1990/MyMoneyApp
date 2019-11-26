class SessionsController < ApplicationController
  def new
  end

  def create
    if
      user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        render 'new'
      end
    end
  end

  def destroy
  end

end
