class Mutante < ApplicationRecord

  def self.login(user, password)
    find_by(login: user, password: password).presence
  end
end
