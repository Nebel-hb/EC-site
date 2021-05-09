class ShopsController < ApplicationController

  def new
    @image = Shop.new
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
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  def shop_params
    params.require(:shop).permit(:shop, :item, :body, :image, :price, :status, category_ids: [])
  end
end
