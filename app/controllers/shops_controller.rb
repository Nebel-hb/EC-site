class ShopsController < ApplicationController

  def new
    @image = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    @shop.save
    redirect_to shops_path
  end

  def index
  end

  def show
  end

  def destroy
  end
end
