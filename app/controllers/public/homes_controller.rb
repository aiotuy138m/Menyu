class Public::HomesController < ApplicationController
  def top
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    end
  end
end
