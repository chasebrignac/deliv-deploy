require 'aws-sdk'

namespace :deploy do
  desc 'Deploy staging'

  Deliv::Deploy.remote_environments.each do |environment|
    task environment, [:branch] => :environment do |_t, _args|
      puts "Starting #{environment}...".white

      Deliv::Deploy.verify_env!
      config = Deliv::Deploy::Config.new(environment)

      client = Aws::OpsWorks::Client.new

      git = Deliv::Deploy::Git.new(environment)
      git.deploy

      resp = client.create_deployment(
        stack_id: config.stack_id,
        app_id: config.app_id,
        command: {
          name: 'deploy'
        },
        comment: "#{git.user_name} deployed to #{environment} at #{Time.current.iso8601}"
      )

      deployment_id = resp[:deployment_id]

      if deployment_id.present?
        puts "Deployed: #{deployment_id}".green
      else
        puts 'Error!'.red
      end
    end
  end
end
