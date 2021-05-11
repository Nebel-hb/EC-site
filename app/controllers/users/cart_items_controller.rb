class Users::CartItemsController < ApplicationController
  before_action :authenticate_user!

    def index
     @cart_items = current_user.cart_items
    end

    def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    @cart_item.save!
     redirect_to cart_items_path

    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end


    def destroy
     @cart_item = CartItem.find(params[:id])
     @cart_item.destroy
     flash.now[:alert] = "#{@cart_item.shop.item}を削除しました"
     redirect_to cart_items_path
    end

    # カート商品を空ににする
    def destroy_all
     @cart_item = current_user.cart_items
     @cart_item.destroy_all
     flash[:alert] = "カートの商品を全て削除しました"
     redirect_to cart_items_path
    end

     private

    def cart_item_params
     params.require(:cart_item).permit(:amount, :shop_id, :user_id)
    end

end
