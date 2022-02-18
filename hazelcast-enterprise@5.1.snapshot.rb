class HazelcastEnterpriseAT51Snapshot < Formula
    desc "Hazelcast is a streaming and memory-first application platform for fast, stateful, data-intensive workloads on-premises, at the edge or as a fully managed cloud service."
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://repository.hazelcast.com/snapshot/com/hazelcast/hazelcast-enterprise-distribution/5.1-SNAPSHOT/hazelcast-enterprise-distribution-5.1-20220218.122400-521.tar.gz"
    sha256 "89c9267ba6d5db90b5935281ab9c42f12e19e8f75cbd033835a22801e02dd9c2"
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
