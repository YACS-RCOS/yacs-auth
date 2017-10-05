module Yacs::Auth::Session
  class << self
    def for_token token
      config.redis.hmget token || {}
    end

    def valid? token
      !!for_token(token)['valid']
    end

    def save token session
      config.redis.hmset token session
    end
  end
end
