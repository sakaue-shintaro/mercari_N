class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice:"変更しました。"
    else 
      redirect_to edit_user_path, alert:"変更に失敗しました。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:introduce,:last_name,:first_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
