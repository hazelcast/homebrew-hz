class HazelcastEnterpriseAT51Dr8 < Formula
    desc "Hazelcast is a streaming and memory-first application platform for fast, stateful, data-intensive workloads on-premises, at the edge or as a fully managed cloud service."
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://repository.hazelcast.com/devel/com/hazelcast/hazelcast-enterprise-distribution/5.1-DR8/hazelcast-enterprise-distribution-5.1-DR8.tar.gz"
    sha256 "865978ea2741767376c4e185338868750b14a5b6b60dc6cee48cf85f2de4d782"
    conflicts_with "hazelcast"
  
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
      etc.install "#{libexec}/config" => "hazelcast"
      rm_rf libexec/"config"
      libexec.install_symlink "#{etc}/hazelcast" => "config"
      prefix.install_metafiles
      inreplace libexec/"lib/hazelcast-download.properties", "hazelcastDownloadId=distribution", "hazelcastDownloadId=brew"
    end

    def caveats
        <<~EOS
          Configuration files have been placed in #{etc}/hazelcast.
        EOS
      end
  
    def post_install
      exec "echo Hazelcast has been installed."
    end

  end
