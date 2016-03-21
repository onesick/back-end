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
        head 204, :location => api_customer_path(customer)
      end
    end

    def update
      customer = Customer.find(params[:id])
      if customer.update(customer_params)
        render json: customer, status: 200
      else
        render json: customer.errors, status: 422
      end

    end

    def destroy
      customer = Customer.find(params[:id])
      customer.destroy
      head 204
    end


    private
      def customer_params
        params.require(:customer).permit(:first_name, :last_name, :phone1_num, :phone2_num, :address)
      end
  # end of CustomersController
  end

end
