class WordsController < ApplicationController
  before_action :login_required
  helper_method :user_learn_words

  def index
    return @words = Word.none if (params[:book_id].blank? && params[:name].blank?)

    @words = params[:book_id] ? book_words : search_words
  end

  def show
    @word = Word.find(params[:id])
  end

  private

  def book_words
    # user clicked words on top
    ::Book.find(params[:book_id]).words
                  .joins("LEFT JOIN learn_notes as l on l.word_id = words.id and l.user_id = #{current_user.id}")
                  .includes(:learn_notes)
                  .order('l.updated_at ASC')
                  .page(1 || params[:page])
  end

  def search_words
    # the best matches on top
    word_name = params[:name]
    order_conditions = o = "CASE WHEN name_a = '#{word_name}' THEN 1 WHEN name_b = '#{word_name}' THEN 2 ElSE 3 END"
    ::Word.where('name_a LIKE ? OR name_b LIKE ?', "%#{ word_name }%", "%#{ word_name }%")
          .includes(:learn_notes)
          .order(order_conditions)
          .page(1 || params[:page])
  end

  def user_learn_words(learn_notes)
    learn_notes.find_by(user: current_user)
  end
end
