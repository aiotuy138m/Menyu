class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to my_page_customers_path
    else
      render :edit
    end
  end

  def confirm
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    if @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    else
      render confirm_customers_path
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end
  
end
