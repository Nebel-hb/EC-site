class Admin::ShopsController < ApplicationController
  before_action :if_not_admin
  before_action :set_shop, only: [:show, :edit, :destroy, :new]


  def new
    @shop = Shop.new
    @genres = Genre.all
  end

  def create
    @shop = Shop.new(shop_params)
    # @shop.user_id = current_user.id
    @shop.save
    redirect_to shops_path
    # redirect_to admin_item_path(@item)
  end

  def index
    @shops = Shop.all
  end

  def show
   @shop=Shop.find(params[:id])
  end


  def edit
   @shop=Shop.find(params[:id])
   @genres = Genre.all
  end

  def update
   @shop=Shop.find(params[:id])
   @shop.update(shop_params)
  # redirect_to admin_items_path

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
