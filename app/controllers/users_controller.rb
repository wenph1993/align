class UsersController < ApplicationController
  before_action :redirect_to_root, only: [:login]

  def login
    return if request.get?
    user = User.find_by(name: handle_params[:name])
    @user = user.authenticate(handle_params[:password]) if user.present?
    if @user
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      flash[:error] = 'Name or password was wrong'
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def register
    return if request.get?
    @user = User.new(handle_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      @errors = @user.errors
      render :register
    end
  end

  private

  def handle_params
    params.require(:users).permit(:name, :password, :password_confirmation)
  end

  def redirect_to_root
    redirect_to tasks_path if User.find_by(id: session[:user_id]).present?
  end

end
