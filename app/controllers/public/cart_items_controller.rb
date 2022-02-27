class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

    def create
        @cart_item = current_customer.cart_items.new(cart_item_params)
        if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
            @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
            @cart_item.quantity += params[:cart_item][:quantity].to_i
            @cart_item.save
            flash[:save] = "カートの商品を追加しました!"
            redirect_to cart_items_path
        elsif @cart_item.save
            @cart_item.save
            flash[:save] = "カートに商品が入りました！"
            redirect_to cart_items_path
        else
            flash[:none] = "個数を選択してください"
            redirect_to request.referer
        end
    end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:update] = "商品の個数を変更しました。"
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    flash[:destroy] = "カートから商品を削除しました。"
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:all] = "カートを空にしました。"
    redirect_to cart_items_path
  end

  private

    def cart_item_params
        params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
    end


end
