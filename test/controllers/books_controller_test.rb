require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get '/api/v1/books'

    assert_response :success
    assert_equal 2, body(response).count
  end
end
