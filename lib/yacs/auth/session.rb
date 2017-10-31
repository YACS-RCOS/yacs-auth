class Yacs::Auth::Session
  class << self
    def for_token token
      decoded_token = Yacs::Auth::Token.decode token
      Yacs::Auth.config.redis.hmget token || {}
    end

    def valid? token
      !!for_token(token)['valid']
    end

    def save token, params={}
      decoded_token = Yacs::Auth::Token.decode token
      session = { token: token, valid: true }.merge params
      Yacs::Auth.config.redis.hmset "session/#{decoded_token['sub']}", *(session.to_a.flatten)
    end
  end
end

# TODO: Do not store token in redis
