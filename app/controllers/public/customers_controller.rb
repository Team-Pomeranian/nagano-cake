class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
  private
  
  def customer_params
    params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :telephone_number)
  end
  
end
