module HerokuSubdomain
  module Git
    class << self
      def current_branch
        result = %x{git branch}.split("\n")
        if result.empty?
          raise "It seems your app is not a git repo"
        else
          result.select { |b| b =~ /^\*/ }.first.split(" ").last.strip
        end
      end

      def current_user
        `git config user.name`.chop!
      end

      def add_remote(name, remote_url)
        `git remote add #{name} #{remote_url}`
      end

      def remotes
        `git remote`.split(/\n/)
      end

      def push(remote_name)
        `git push --force #{remote_name} #{current_branch}:master`
      end
    end
  end
end