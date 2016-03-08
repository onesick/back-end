require 'test_helper'

class ListingCustomersTest < ActionDispatch::IntegrationTest

  test 'returns list of all customers' do
    get '/api/customers'

    assert_equal 200, response.status
    refute_empty response.body

  end

  test 'returns customer filtered by name' do
    wonsik = Customer.create!(first_name: "Wonsik", last_name: "Jeong")
    yibo = Customer.create!(first_name: "Yibo", last_name: "Zhao")

    get '/api/customers?first_name=Wonsik'
    assert_equal 200, response.status

    customers = JSON.parse(response.body, symbolize_names: true)
    names = customers.collect { |c| c[:first_name]}
    assert_includes names, 'Wonsik'
    refute_includes names, 'Yibo'

  end

  test 'returns customer by id' do
    customer = Customer.create!(first_name: "Wonsik")
    get "/api/customers/#{customer.id}"
    assert_equal 200, response.status

    customer_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal customer.first_name, customer_response[:first_name]
  end
end
