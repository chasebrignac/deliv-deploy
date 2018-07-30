module Deliv
  module Deploy
    class Config
      def initialize(environment, filename = nil)
        @environment = environment
        load!(filename)
        verify_environments!
      end

      def method_missing(name, *args, &block)
        OpenStruct.new(@config[@environment]).send(name)
      end

      private

      def load!(filename = nil)
        @filename = filename || Rails.root.join('.deploy.yml') if defined?(Rails)
        file = File.read(@filename)
        @config = YAML.load(file).with_indifferent_access
      end

      def verify_environments!
        Deliv::Deploy.remote_environments.each { |environment| verify_environment!(environment) }
      end

      def verify_environment!(environment)
        raise ConfigError, "Missing `#{environment}` from `#{@filename}`" unless @config[environment].present?
      end
    end
  end
end
