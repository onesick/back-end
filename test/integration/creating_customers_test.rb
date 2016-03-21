class CreatingCustomersTest < ActionDispatch::IntegrationTest
  test 'create customer' do
    post "/api/customers",
      {customer:
        {first_name: "Wonsik", last_name: "Jeong"}
      }

      # .to_json,
      # {"Accept" => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 204, response.status
    # assert_equal Mime::JSON, response.content_type

    # json() is a customized mthod to parse body in json. Can be seen on test_helper.rb
    # customer = json(response.body)
    # assert_equal api_customer_path(customer[:id]), response.location
  end
end
