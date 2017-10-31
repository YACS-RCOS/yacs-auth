require 'jwt'

class Yacs::Auth::Token
  class << self
    def encode user_id:
      JWT.encode({ sub: user_id }, Yacs::Auth.config.secret, 'HS256')
    end

    def decode token
      JWT.decode token, Yacs::Auth::config.secret, true, { :algorithm => 'HS256' }
    end
  end
end
