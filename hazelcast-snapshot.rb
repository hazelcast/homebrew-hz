class HazelcastSnapshot < Formula
    desc "Hazelcast is a streaming and memory-first application platform for fast, stateful, data-intensive workloads on-premises, at the edge or as a fully managed cloud service."
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    url "https://oss.sonatype.org/content/repositories/snapshots/com/hazelcast/hazelcast-distribution/5.2-SNAPSHOT/hazelcast-distribution-5.2-20220304.100008-20.tar.gz"
    sha256 "5aade637a812383f7b357aa2993f874228f7998a680f2ad13776be0de4e8baf1"
    conflicts_with "hazelcast-enterprise"
  
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
