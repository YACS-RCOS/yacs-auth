require "yacs/auth/version"
require "yacs/auth/config"
require "yacs/auth/token"
require "yacs/auth/session"

module Yacs
  module Auth
    class << self
      attr_accessor :config
    end

    def self.sign_in user
      token = Token.encode user_id: user.id
      Session.save token, { valid: true }
      token
    end

    def self.config
      @config ||= Config.new
    end

    def self.reset
      @config = Config.new
    end

    def self.configure
      yield config
    end
  end
end
