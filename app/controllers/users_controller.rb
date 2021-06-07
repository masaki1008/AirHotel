class UsersController < ApplicationController
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation, :decoration, :image )
  end
  
end
