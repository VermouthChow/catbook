class LearnNotesController < ApplicationController
  before_action :login_required

  def create
    @learned = current_user.learn_notes.find_or_initialize_by(word_id: params[:word_id])
    @learned.status = params[:status]
    @learned.save!
    @updated_word = @learned.reload.word
  end
end
