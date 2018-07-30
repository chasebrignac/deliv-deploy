module Deliv
  module Deploy
    class Git
      attr_accessor :source_remote, :source_branch, :release_remote, :release_branch, :release_tag

      def initialize(environment)
        @environment = environment
        @source_remote = 'origin'
        @source_branch = current_branch
        @release_remote = 'upstream'
        @release_branch = "release-#{@environment}"
        @release_tag = "#{@release_branch}-#{Time.current.to_i}"
      end

      def deploy
        print_debug
        old_branch = current_branch

        `git commit --all --message='Saving before #{release_tag}'`
        `git push #{source_remote} #{source_branch}`
        `git fetch #{source_remote} #{source_branch}`
        `git checkout --quiet #{source_remote}/#{source_branch}`
        `git tag --message='#{user_name} pointed #{release_branch} at #{current_branch}' #{release_tag}`
        `git push --force --follow-tags #{release_remote} HEAD:#{release_branch}`
        `git checkout #{old_branch}`
      end

      def current_branch
        `git rev-parse --abbrev-ref HEAD`&.squish
      end

      def user_name
        `git config --get user.name`&.squish
      end

      def print_debug
        puts "User Name: #{user_name}".blue
        puts "Current Branc: #{current_branch}".blue
        puts  "Source Remote: #{source_remote}".blue
        puts  "Source Branch: #{source_branch}".blue
        puts  "Release Remote: #{release_remote}".blue
        puts  "Release Branch: #{release_branch}".blue
      end
    end
  end
end
