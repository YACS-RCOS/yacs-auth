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
      Session.create user
    end

    def self.sign_out user
      Session.destroy user
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
