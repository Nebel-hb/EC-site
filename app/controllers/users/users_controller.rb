class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
  end

  def edit
    @user = User.find_by(id:current_user.id)
  end

  def update
    current_user.update(user_params)
    redirect_to users_mypage_path
  end

  def unsubscribe
  end

  def withdraw
    user = User.find_by(id:current_user.id)
    user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:name_kana,:postal_code,:address,:telephone_number,:email)
  end

  def is_deleted_params
    params.permit(:is_deleted)
  end
end

