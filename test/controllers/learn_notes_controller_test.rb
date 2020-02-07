require 'test_helper'

class LearnNotesControllerTest < ActionDispatch::IntegrationTest
  def setup
    combine_bookone_and_3words
    sign_in_as_default
  end

  def test_create_when_already_recorded
    before_count = LearnNote.count
    post '/api/v1/learn_notes', params: { word_id: words(:words_two).id, status: 'grasped' }

    assert_response :success
    assert_equal before_count, LearnNote.count
    assert_equal 'grasped', body(response)['learnNotes']['status']
  end

  def test_create_new_recorded
    word_id = words(:words_one).id
    learn_notes(:learn_one).delete
    before_count = LearnNote.all.reload.count
    post '/api/v1/learn_notes', params: { word_id: word_id, status: 'grasped' }

    assert_response :success
    assert_equal before_count + 1, LearnNote.count
    assert_equal 'grasped', body(response)['learnNotes']['status']
  end
end
