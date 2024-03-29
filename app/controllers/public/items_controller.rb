class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(8)
    @items_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

private


end
