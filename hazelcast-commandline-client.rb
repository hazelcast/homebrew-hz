# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class HazelcastCommandlineClient < Formula
  desc "Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client"
  version "1.0.0-beta1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v1.0.0-beta1/hazelcast-commandline-client_1.0.0-beta1_Darwin_arm64.tar.gz"
      sha256 "3320832c2155f69ea2c4b25271b83d0782fb5b17eaac78433a371a6d0eec75dc"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v1.0.0-beta1/hazelcast-commandline-client_1.0.0-beta1_Darwin_x86_64.tar.gz"
      sha256 "5e96de60eb469903b9fa9818f6747eb726b74ec940d69b29fa481304fe30865e"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v1.0.0-beta1/hazelcast-commandline-client_1.0.0-beta1_Linux_x86_64.tar.gz"
      sha256 "8a578f3df4692706bc3619b94af91fe7de0978637a127b3fb68e343a3b21b9c5"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v1.0.0-beta1/hazelcast-commandline-client_1.0.0-beta1_Linux_arm64.tar.gz"
      sha256 "02fb21ed12a9fb79002183807bf058d1b61e5b711243ded9a00340002d7d441e"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
  end

  def post_install
    ohai "Example usages:
    * `hzc` - start an interactive shell 🚀
    * `hzc map --name my-map put --key hello --value world` - put entry into map"
        completion_warning = <<~EOS
          ⚠️  To have superior experience, enable autocompletion on Brew. ⚠️
          You need to enable autocompletion just once for Brew. If it is already enabled, you can skip this part.
          ▪ For Bash users:
            1) `brew install bash-completion` and follow the printed \"Caveats\" section. Example \"Caveats\" instructions:
               Add the following line to your ~/.bash_profile:
               # !! Note that paths may differ depending on your installation, so you should follow the Caveats section on your system.
               [[ -r \"/home/ubuntu/.linuxbrew/etc/profile.d/bash_completion.sh\" ]] && . \"/home/ubuntu/.linuxbrew/etc/profile.d/bash_completion.sh\"
            2) `source ~/.bash_profile`
          ▪ For Zsh users:
          Follow https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
        EOS
        print completion_warning
  end
end
