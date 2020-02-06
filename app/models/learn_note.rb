class LearnNote < ApplicationRecord
  belons_to :user
  belons_to :words
end
