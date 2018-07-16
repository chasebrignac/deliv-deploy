require 'aws-sdk'

namespace :rollback do
  Deliv::Deploy.verify_env!
  client = Aws::OpsWorks::Client.new
  # TODO: Fix this.
  task test: :environment do
    resp = client.create_deployment(
      stack_id: 'be987488-25e0-405f-b5c2-7aee42dc3e84',
      app_id: 'e30a40bf-7f06-42a4-a15f-01329ac3f605',
      command: {
        name: 'rollback'
      },
      comment: 'Test'
    )

    ap resp
  end
end
