class HazelcastManagementCenterAT52Snapshot < Formula
    desc "Tool to run Hazelcast Management Center"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    version "5.0.4"
    url "https://repository.hazelcast.com/download/management-center/hazelcast-management-center-latest-snapshot.tar.gz"
    sha256 "d1d9082a7da9762566daebc13f9960d5d7eace3b7d92a59d7e249bef11eff70b"

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
