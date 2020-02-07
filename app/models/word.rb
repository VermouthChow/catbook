class Word < ApplicationRecord
  has_and_belongs_to_many :books
  has_many :learn_notes
  has_many :notebooks

  validates :name_a, :name_b, :sounds_a, :sounds_b, :explanation, presence: true
end
