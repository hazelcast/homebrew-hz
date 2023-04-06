class HazelcastManagementCenterSnapshot < Formula
    desc "Tool to run Hazelcast Management Center"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    version "5.3-SNAPSHOT"
    url "https://repository.hazelcast.com/download/management-center/hazelcast-management-center-latest-snapshot.tar.gz"
    sha256 "423d43b7cb3d8f82a59636455efbc007494c08aa797f1da52d5a95c1a3fd832b"
    conflicts_with "hazelcast-management-center@5.3.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.1.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.1.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.0.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.2", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center", because: "you can install only a single hazelcast-management-center package"

    depends_on "openjdk" => :recommended

    def install
      libexec.install Dir["*"]
      Dir["#{libexec}/bin/*mc*"].each do |path|
        executable_name = File.basename(path)
        if executable_name.end_with? ".bat"
          next
        end
        (bin/executable_name).write_env_script libexec/"bin/#{executable_name}", Language::Java.overridable_java_home_env
      end
      prefix.install_metafiles
    end

    def post_install
      exec "echo Hazelcast Management Center has been installed."
    end

  end
