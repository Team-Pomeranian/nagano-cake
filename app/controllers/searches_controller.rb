class SearchesController < ApplicationController
  def search
    @items = Item.search(params[:search])
  end
  
end
