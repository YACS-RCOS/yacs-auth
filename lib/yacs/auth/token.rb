require 'jwt'

module Yacs::Auth::Token
  class << self
    def encode user_id:
      JWT.encode { sub: user_id }, config.secret, 'HS256'
    end

    def self.decode token
      JWT.decode token, config.secret, true, { :algorithm => 'HS256' }
    end
  end
end
