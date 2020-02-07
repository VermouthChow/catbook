require 'test_helper'

class NotebooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    combine_bookone_and_3words
    sign_in_as_default
  end

  def test_index
    get '/api/v1/notebooks'

    assert_response :success
    assert_equal 2, body(response).count
  end

  def test_create
    before_count = Notebook.count
    post '/api/v1/notebooks', params: { word_id: words(:words_one).id }

    assert_response :success
    assert_equal true, body(response)["note"]["addSuccess"]
    assert_equal before_count + 1, Notebook.count
  end

  def test_deleted
    delete "/api/v1/notebooks/#{ notebooks(:note_one).id }"

    assert_response :success
    assert_equal true, body(response)["note"]["deleteSuccess"]
    assert_equal notebooks(:note_one).reload.status, 'inactived'
  end
end
