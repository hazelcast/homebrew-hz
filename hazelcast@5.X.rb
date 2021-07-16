class HazelcastAT5X < Formula
    desc "Tool to run Hazelcast IMDG member instances locally"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v5.2021.07.1/hazelcast-5.0-BETA-1.tar.gz"
    sha256 "f108d22a1aec61bbd637f89ff522af7d9861ef13afcfad24a5095127f04f091d"
  
    bottle :unneeded
  
    depends_on "openjdk" => :recommended
  
    def install
      libexec.install Dir["*"]
      (bin/"hz").write_env_script libexec/"bin/hz", Language::Java.overridable_java_home_env
      (bin/"hz-cli").write_env_script libexec/"bin/hz-cli", Language::Java.overridable_java_home_env
      prefix.install_metafiles
      inreplace libexec/"bin/download/hazelcast-download.properties", "hazelcastDownloadId=CLI", "hazelcastDownloadId=CLI_BREW"
    end
  
    def post_install
      exec "hz"
    end
  
  end
  