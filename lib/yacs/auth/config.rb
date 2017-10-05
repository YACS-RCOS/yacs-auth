module Yacs
  module Auth
    class Config
      attr_accessor :secret, :redis

      def initialize
        @secret = nil
        @redis = nil
      end
    end
  end
end
