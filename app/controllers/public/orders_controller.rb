class Public::OrdersController < ApplicationController
  def new
  end

  def complete
  end

  def confirm
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end
end
