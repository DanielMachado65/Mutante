# user
class User < ApplicationRecord
  has_many :mutantes

  def self.login(user, password)
    find_by(login: user, password: password).presence
  end
end
