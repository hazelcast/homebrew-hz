class HazelcastManagementCenterAT60Snapshot < Formula
    desc "Tool to run Hazelcast Management Center"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    version "6.0-SNAPSHOT"
    url "https://repository.hazelcast.com/download/management-center/hazelcast-management-center-latest-snapshot.tar.gz"
    sha256 "e6ea677c3a8d52ef8881a3d53d15e57d2a61e9bab0753920ec3f440a173dd1ad"
    conflicts_with "hazelcast-management-center@5.5.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.4.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.4.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.4.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.3", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.2", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.1.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.1.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.1.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.0.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.5", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.3", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.2", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center", because: "you can install only a single hazelcast-management-center package"

    depends_on "openjdk@21" => :recommended

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
