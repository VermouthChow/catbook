class LearnNote < ApplicationRecord
  belongs_to :user
  belongs_to :words

  validates :status, :user_id, :word_id, presence: true
end
