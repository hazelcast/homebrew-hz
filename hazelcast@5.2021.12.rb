class HazelcastAT5202112 < Formula
    desc "Tool to run Hazelcast IMDG member instances locally"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v5.2021.12/hazelcast-5.0.1.tar.gz"
    sha256 "4e4735d070cb28ff9c3a28e4f5cc6cad4bd089558b899ae2710eabff803f3ce3"
  
    bottle :unneeded
  
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
      inreplace libexec/"bin/download/hazelcast-download.properties", "hazelcastDownloadId=CLI", "hazelcastDownloadId=CLI_BREW"
    end
  
    def post_install
      exec "hz"
    end
  
  end
  