class User < ApplicationRecord
  has_one :notebook, dependent: :destroy
  has_one :learn_book, dependent: :destroy
end
