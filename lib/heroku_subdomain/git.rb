module HerokuSubdomain
  module Git
    class << self
      attr_accessor :base_repo
      @base_repo = "git://github.com/jetthoughts/jettime.git"

      def current_branch
        return "master"
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
        #`git push --force #{remote_name} #{current_branch}:master`
        #`git push #{remote_name} refs/remotes/local/#{current_branch}:refs/heads/master`
      end

      def pull(remote_name)
        `git pull #{remote_name} master`
      end

      def git_directory?
        %x{git status 2>&1}.chop != 'fatal: Not a git repository (or any of the parent directories): .git'
      end

      def init_directory
        init_ssh_config
        %x{git init .}
        base_repo ||= "git://github.com/jetthoughts/jettime.git"
        add_remote("origin", base_repo)
        pull("origin")
      end

      def init_ssh_config
        `mkdir -p ~/.ssh`
        `echo 'StrictHostKeyChecking=no' > ~/.ssh/config`
        `echo 'Host heroku.com' >> ~/.ssh/config`
        `echo ' VerifyHostKeyDNS yes' >> ~/.ssh/config`
      end

      def add_key(text, force=false)
        key_path = ".ssh/id_rsa"

        return if !force && File.exists?(key_path)

        f = File.new(key_path, File::CREAT|File::TRUNC|File::RDWR, 0600)
        f << text
        f.close
      end
    end
  end
end
