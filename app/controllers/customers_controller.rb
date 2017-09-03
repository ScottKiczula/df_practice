class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      format.html { redirect_to new_reservation_url(@customter.id => :customer_id) }
    else
      render new_customer
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :guests)
    end
end
