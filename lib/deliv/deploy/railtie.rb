module Deliv
  module Deploy
    class Railtie < Rails::Railtie
      rake_tasks do
        Dir[File.join(File.expand_path('../tasks', __dir__), '*.rake')].each { |f| load f }
      end
    end
  end
end
