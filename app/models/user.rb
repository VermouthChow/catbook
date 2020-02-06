class User < ApplicationRecord
  has_one :notebook, dependent: :destroy
  has_one :learn_book, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false },
                       presence: true,
                       length: { in: 4..16 }
  validates :password, presence: true,
                       length:{ in: 8..16 }  
end
