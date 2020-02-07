class NotebooksController < ApplicationController
  before_action :login_required

  def index
    @note_words = current_user.notebooks.includes(:word).order(updated_at: :DESC).page(1 || params[:page])
  end

  def create
    @new_word = ::Notebook.create!(word_id: params[:word_id], 
                                    user: current_user, 
                                    status: 'actived')
  end

  def destroy
    @note_word = current_user.notebooks.find(params[:id])
    @note_word.inactived!
  end
end
