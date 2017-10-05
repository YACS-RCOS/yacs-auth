module Yacs::Auth::Token
  class << self
    def encode user_id:, roles: = %s(user)
      JWT.encode payload, config.secret, 'HS256'
    end

    def self.decode token
      JWT.decode token, config.secret, true, { :algorithm => 'HS256' }
    end
  end
end
