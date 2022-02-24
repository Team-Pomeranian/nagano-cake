class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(8)
    @items_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
