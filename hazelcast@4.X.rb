class HazelcastAT4X < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2020.09/hazelcast-command-line-4.2020.09.tar.gz"
  sha256 "b2a98a9a6d130d1c5a693b52640af0d721ce6c14e89b5be437a869d1207d901c"

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
