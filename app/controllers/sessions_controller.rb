class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by_email(params[:email])
        if @user.authenticate(params[:password])
          session[:user_id] = @user.id
          flash[:success] = "Login Successful."
          redirect_to users_path
        else
          flash.now[:error] = "Incorrect Password."
          render 'new'
        end
    else
      flash.now[:error] = "User not found."
      render 'new'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
