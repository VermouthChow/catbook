class Word < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name_a, :name_b, :sounds_a, :sounds_b, :explanation, presence: true
end
