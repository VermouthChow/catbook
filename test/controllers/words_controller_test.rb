require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  def setup
    combine_bookone_and_3words
    sign_in_as_default
  end

  def test_index
    get '/api/v1/words', params: { book_id: books(:book_one).id }

    assert_response :success
    assert_equal 3, body(response).count
    assert_equal words(:words_one).id, body(response).last['id']
  end

  def test_index_search
    get '/api/v1/words', params: { name: 'ap' }

    assert_response :success
    assert_equal 2, body(response).count
  end

  def test_show
    w = words(:words_one)
    get "/api/v1/words/#{w.id}"

    assert_response :success
    assert_equal 1, body(response).count
    assert_equal w.id, body(response)['word']['id']
  end
end
