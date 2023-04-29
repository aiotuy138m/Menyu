class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
    @posts = Post.where(customer_id: current_customer.id).includes(:customer).order("created_at DESC")
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to my_page_customers_path, info: "アカウント情報を変更しました"
    else
      render :edit, danger: "アカウント情報の変更に失敗しました"
    end
  end

  def confirm
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    if @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path, info: "退会しました　また機会があればお会いしましょう"
    else
      render confirm_customers_path, danger: "退会に失敗しました　再度お試しください"
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end
  
end
