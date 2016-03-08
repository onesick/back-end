module API
  class CustomersController < ApplicationController
    def index
      customers = Customer.all
      render json: customers, status: 200

    end

  end

end
