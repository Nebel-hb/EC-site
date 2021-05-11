class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    @users = User.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:name_kana,:postcode,:address_city,:address_street,:address_building,:telephone_number,:email,:is_deleted)
  end
end
