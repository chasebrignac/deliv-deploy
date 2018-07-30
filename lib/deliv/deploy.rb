require 'awesome_print'

require 'deliv/deploy/config'
require 'deliv/deploy/git'
require 'deliv/deploy/railtie' if defined?(Rails)
require 'deliv/deploy/version'

module Deliv
  module Deploy
    REQUIRED_ENV = %w[AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_REGION].freeze

    class ConfigError < StandardError; end

    def self.verify_env!
      REQUIRED_ENV.each { |e| raise "Missing `ENV['#{e}']`" unless ENV[e].present? }
    end

    def self.environments
      Dir[Rails.root.join('config', 'environments', '*.rb')].map { |f| File.basename(f, '.*').to_sym }
    end

    def self.local_environments
      [:test, :development]
    end

    def self.remote_environments
      environments - local_environments
    end
  end
end
