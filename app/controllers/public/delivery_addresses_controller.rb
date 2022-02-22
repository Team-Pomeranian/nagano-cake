class Public::DeliveryAddressesController < ApplicationController
  def index
    @customer = current_customer
    @delivery_address = DeliveryAddress.new
    @delivery_addresses = @customer.delivery_addresses
  end

  def create
    @delivery_address = DeliveryAddress.new(address_params)
    @delivery_address.customer_id = current_customer.id
    if  @delivery_address.save
      redirect_to request.referer
    else
      @customer = current_customer
      @delivery_addresses = @customer.delivery_addresses
      render 'index'
    end
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.update(address_params)
      redirect_to "/delivery_addresses"
    else
      render "edit"
    end
  end



  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:delivery_address).permit(:name, :postcode, :address)
  end

end
