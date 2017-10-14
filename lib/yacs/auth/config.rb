module Yacs
  module Auth
    class Config
      attr_accessor :secret, :redis

      def initialize
        @secret = ENV['YACS_AUTH_SECRET']
        @redis = nil
      end
    end
  end
end
