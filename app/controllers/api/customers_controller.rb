module Api
  class CustomersController < ApplicationController
    def index
      customers = Customer.all
      # filtering by names
      if first_name = params[:first_name]
        customers = customers.where(first_name: first_name)
      end

      render json: customers, status: 200
    end

    def show

      customer = Customer.find(params[:id])
      render json: customer, status: 200
    end

    def create
      customer = Customer.new(customer_params)
      if customer.save
        render json: customer, status: 201, :location => api_customer_path(customer)
      end
    end


    private
      def customer_params
        params.require(:customer).permit(:first_name, :last_name, :phone1_num, :phone2_num, :address)
      end
  # end of CustomersController
  end

end
