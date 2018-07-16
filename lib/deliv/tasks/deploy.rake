require 'aws-sdk'

namespace :deploy do
  desc 'Deploy staging'
  task staging2: :environment do
  end

  task staging: :environment do
    puts 'Starting staging...'.white

    Deliv::Deploy.verify_env!
    client = Aws::OpsWorks::Client.new

    git = Deliv::Deploy::Git.new('staging')
    git.deploy

    resp = client.create_deployment(
      stack_id: 'be987488-25e0-405f-b5c2-7aee42dc3e84',
      app_id: 'e30a40bf-7f06-42a4-a15f-01329ac3f605',
      command: {
        name: 'deploy'
      },
      comment: 'David Deployed Staging'
    )

    ap resp
    puts 'Deployed!'.green
  end
end
