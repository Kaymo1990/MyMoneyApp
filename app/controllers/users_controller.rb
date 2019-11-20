class UsersController < ApplicationController

  protect_from_forgery

  def show
    if logged_in?
      @user = User.find(params[:id])
      @posts = Post.all
    else
      redirect_to sessions_new_url
    end
  end

  def index
    @users = User.all
  end
 
  def new
      @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in(@user)
      # session[:current_user_id] = @user.id
      # redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    redirect_to user_path(@user.id)
    # Handle a successful update.
  else
    render 'edit'
  end
end

  def user_params
    params.require(:user).permit(:username, :salary, :start, :end, :password)
  end
end