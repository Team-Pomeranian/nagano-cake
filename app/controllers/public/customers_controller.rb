class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private




end
