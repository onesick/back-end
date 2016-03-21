class DeletingCustomersTest < ActionDispatch::IntegrationTest
  setup {@customer = Customer.create(first_name: "delete tester")}

  test 'deleting existing customers' do
    delete "/api/customers/#{@customer.id}"
    assert_equal 204, response.status

  end
end
