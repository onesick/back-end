class UpdatingCustomersTest < ActionDispatch::IntegrationTest
  setup {@customer = Customer.create!(first_name: "first test name")}

  test 'successful update' do
    patch "/api/customers/#{@customer.id}",
    {customer: {first_name: 'First name test edited'}}.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 200, response.status
    assert_equal 'First name test edited', @customer.reload.first_name
  end

  test 'unsuccessful update' do
    patch "/api/customers/#{@customer.id}",
    {customer: {first_name: 's'}}.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
  end


end
