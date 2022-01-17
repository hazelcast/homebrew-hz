class HazelcastAT5X < Formula
    desc "A tool that allows users to install & run Hazelcast"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v5.2021.07.1/hazelcast-5.0-BETA-1.tar.gz"
    sha256 "f108d22a1aec61bbd637f89ff522af7d9861ef13afcfad24a5095127f04f091d"
    conflicts_with "hazelcast-enterprise", because: "You can install either hazelcast (open source under Apache 2) or hazelcast-enterprise (under Hazelcast license)"
  
    depends_on "openjdk" => :recommended

    def install
      libexec.install Dir["*"]
      Dir["#{libexec}/bin/hz*"].each do |path|
        executable_name = File.basename(path)
        if executable_name.end_with? ".bat"
          next
        end
        (bin/executable_name).write_env_script libexec/"bin/#{executable_name}", Language::Java.overridable_java_home_env
      end
      prefix.install_metafiles
      inreplace libexec/"lib/hazelcast-download.properties", "hazelcastDownloadId=distribution", "hazelcastDownloadId=brew"
    end
  
    def post_install
      exec "hz"
    end

  end
