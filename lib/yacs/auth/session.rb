class Yacs::Auth::Session
  class << self
    def for_token token
      Yacs::Auth.config.redis.hmget token || {}
    end

    def valid? token
      !!for_token(token)['valid']
    end

    def save token, session
      Yacs::Auth.config.redis.hmset token, session
    end
  end
end

# TODO: Do not store token in redis
