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

    if params[:order][:address_option] == "0"
        @order.postcode = current_customer.post_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
        ship = DeliveryAddress.find(params[:order][:customer_id])
        @order.postcode = ship.postcode
        @order.address = ship.address
        @order.name = ship.name
    elsif params[:order][:address_option] = "2"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
        render 'new'
    end
        @cart_items = current_customer.cart_items.all
        @order.customer_id = current_customer.id
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
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @ordered_item = OrderItem.new
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.quantity = cart_item.quantity
      @ordered_item.price = (cart_item.item.toprice*1.1).floor
      @ordered_item.order_id =  @order.id
      @ordered_item.save
      end

      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path

  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postcode, :postage, :payment, :status, :total_price)
  end

end
