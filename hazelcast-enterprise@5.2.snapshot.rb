class HazelcastEnterpriseAT52Snapshot < Formula
    desc "Hazelcast is a streaming and memory-first application platform for fast, stateful, data-intensive workloads on-premises, at the edge or as a fully managed cloud service."
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://repository.hazelcast.com/snapshot/com/hazelcast/hazelcast-enterprise-distribution/5.2-SNAPSHOT/hazelcast-enterprise-distribution-5.2-20220315.105647-59.tar.gz"
    sha256 "4d6d82fe2b3fefbb811f22b3892f58e21078d152b48496a8c3222c76bfcb1f19"
    conflicts_with "hazelcast-enterprise@5.1.snapshot", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise@5.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise@5.1.2", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise@5.0", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise@5.0.2", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise@5.0.2.2", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise@5.0.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise-snapshot", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise-devel", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise-5.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-enterprise-5.0", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.2.snapshot", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.1.snapshot", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.1.2", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.0", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.0.2", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.0.2.2", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@5.0.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.06", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.03", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.03.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.02.9", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.02.8", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.02.7", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2021.02.6", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2020.12", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2020.11", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2020.11.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast@4.2020.09", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-5.1", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-5.0", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-snapshot", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast-devel", because: "you can install only a single hazelcast or hazelcast-enterprise package"
    conflicts_with "hazelcast", because: "you can install only a single hazelcast or hazelcast-enterprise package"

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
