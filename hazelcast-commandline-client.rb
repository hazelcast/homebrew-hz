# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class HazelcastCommandlineClient < Formula
  desc "Hazelcast Command line Client"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client"
  version "5.2.0-beta2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v5.2.0-beta2/hazelcast-commandline-client_5.2.0-beta2_Darwin_arm64.tar.gz"
      sha256 "26a45a0a4c3fdeabc97169d67ea020c3e1f4eb514f3094867f693f4e4242db6b"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v5.2.0-beta2/hazelcast-commandline-client_5.2.0-beta2_Darwin_x86_64.tar.gz"
      sha256 "4531a4595aabca1b6a335020fc4508ea0136a0c529a85b4054e6fb059c67318a"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v5.2.0-beta2/hazelcast-commandline-client_5.2.0-beta2_Linux_arm64.tar.gz"
      sha256 "bff2bd0b871b86cc8acde59d924e22674566a1fac6fd71827462761ed1fc7e9c"

      def install
        bin.install "hzc"
        bash_completion.install "extras/bash_completion.sh"
        zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hazelcast/hazelcast-commandline-client/releases/download/v5.2.0-beta2/hazelcast-commandline-client_5.2.0-beta2_Linux_x86_64.tar.gz"
      sha256 "6d6cc3dbfaf9487635184b5a1be3a418f0ae47048f534b975c8cbdf33a945dcb"

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
