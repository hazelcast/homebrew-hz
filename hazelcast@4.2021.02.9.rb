class HazelcastAT42021029 < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2021.02.9/hazelcast-4.1.1.tar.gz"
  sha256 "04f791bf80cad84c33f29d1d43e576eb2a839cd4029d0979f386acff1535538d"

  depends_on "openjdk" => :recommended

  def install
    libexec.install Dir["*"]
    (bin/"hz").write_env_script libexec/"bin/hz", Language::Java.overridable_java_home_env
    prefix.install_metafiles
    inreplace libexec/"bin/download/hazelcast-download.properties", "hazelcastDownloadId=CLI", "hazelcastDownloadId=CLI_BREW"
  end

  def post_install
    exec "hz"
  end

end
