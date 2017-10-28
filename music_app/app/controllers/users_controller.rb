class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render JSON: "User Created"
    else
      flash.now(@user.errors.full_messages)
    end
  end

  def new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
