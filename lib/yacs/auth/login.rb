module Yacs::Auth::Login
  class << self
    def sign_in user
      token = Token.encode user_id: user.id
      Session.save token, { valid: true }
      token
    end
  end
end
