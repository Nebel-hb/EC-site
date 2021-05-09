class Admin::ShopsController < ApplicationController
  before_action :if_not_admin
  before_action :set_shop, only: [:show, :edit, :destroy, :new]


  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    # @shop.user_id = current_user.id
    @shop.save
    redirect_to shops_path
  end

  def index
    @shops = Shop.all
  end

  def show
  end

  def destroy
  end

  def shop_params
    params.require(:shop).permit(:item, :body, :image, :genre, :price, :status)
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_shop
    # @shop = Shop.find(params[:id])
  end

end