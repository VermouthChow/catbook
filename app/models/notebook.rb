class Notebook < ApplicationRecord
  belongs_to :user
  belongs_to :word

  validates :status, :user_id, :word_id, presence: true

  enum status: [ :actived, :inactived ]
end
