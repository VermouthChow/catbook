require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  def setup
    combine_bookone_and_3words
  end

  def test_index
    get '/api/v1/books'

    assert_response :success
    assert_equal 2, body(response).count
  end
end
