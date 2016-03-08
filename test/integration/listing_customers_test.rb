require 'test_helper'

class ListingCustomersTest < ApplicationDispatch::IntegrationTest

  test 'returns list of all zombies' do
    get '/customers'

    assert_equal 200, response.status
    refute_empty response.body

  end
end
