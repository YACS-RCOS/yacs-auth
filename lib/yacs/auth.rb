require "yacs/auth/version"
require "yacs/auth/config"

module Yacs
  module Auth
    class << self
      attr_accessor :config
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
