class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def complete
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @postage = 800
    @order.payment = params[:order][:payment]
    @total_fee = current_customer.cart_items.cart_items_total_price(@cart_items)
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @total_fee = current_customer.cart_items.cart_items_total_price(@cart_items)
    @postage = 800
      if @order.save
        @cart_items.each do |cart|
          order_item = OrderItem.new(order_id: @order.id)
          order_item.price = cart.item.price_no_tax
          order_item.quantity = cart.quantity
          order_item.item_id = cart.item_id
          order_item.save!
        end
        redirect_to complete_orders_path
        @cart_items.destroy_all
      else
        @order = Order.new(order_params)
        render :new
      end
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postcode, :postage, :payment, :status, :total_price)
  end

end
