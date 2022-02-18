class HazelcastEnterprise < Formula
    desc "Hazelcast is a streaming and memory-first application platform for fast, stateful, data-intensive workloads on-premises, at the edge or as a fully managed cloud service."
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://repository.hazelcast.com/snapshot/com/hazelcast/hazelcast-enterprise-distribution/5.1-SNAPSHOT/hazelcast-enterprise-distribution-5.1-20220217.191336-511.tar.gz"
    sha256 "ac9f264386c4085b6ef2c37d91ff1030c6f316010df97754628a663803fb4933"
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
      prefix.install_metafiles
      inreplace libexec/"lib/hazelcast-download.properties", "hazelcastDownloadId=distribution", "hazelcastDownloadId=brew"
    end
  
    def post_install
      exec "echo Hazelcast has been installed."
    end

  end
