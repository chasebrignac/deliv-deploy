require 'awesome_print'

require 'deliv/deploy/git'
require 'deliv/deploy/railtie' if defined?(Rails)
require 'deliv/deploy/version'

module Deliv
  module Deploy
    REQUIRED_ENV = %w[AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_REGION].freeze

    def self.verify_env!
      REQUIRED_ENV.each { |e| raise "Missing `ENV['#{e}']`" unless ENV[e].present? }
    end
  end
end
