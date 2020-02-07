class User < ApplicationRecord
  has_many :notebooks, dependent: :destroy
  has_many :learn_notes, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false },
                       presence: true,
                       length: { in: 4..16 }
  validates :password, presence: true,
                       length:{ in: 8..16 }

  def remember_token
    [id, Digest::SHA512.hexdigest(password)].join('$')
  end

  def self.find_by_remember_token(token)
    user = find_by_id(token.split('$').first)
    (user && Rack::Utils.secure_compare(user.remember_token, token)) ? user : nil 
  end 
end
