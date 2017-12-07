class Yacs::Auth::Session
  class << self
    def get_session_from_token token
      decoded_token = Yacs::Auth::Token.decode token
      session = Yacs::Auth.config.redis.hmget "session/#{decoded_token['sub']}"
      { token: decoded_token, session: session }
    end

    def create user, params={}
      token = Yacs::Auth::Token.encode user_id: user.id
      session = { token: token, valid: true }.merge params
      Yacs::Auth.config.redis.hmset "session/#{user.id}", *(session.to_a.flatten)
      token
    end

    def destroy user
      Yacs::Auth.config.redis.hmset "session/#{user.id}", 'valid', false
    end
  end
end

# TODO: Do not store token in redis
