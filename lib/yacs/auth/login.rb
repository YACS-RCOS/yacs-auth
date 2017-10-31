class Yacs::Auth::Login
  class << self
    def sign_in user
      token = Yacs::Auth::Token.encode user_id: user.id
      Yacs::Auth::Session.save token, { valid: true }
      token
    end
  end
end
