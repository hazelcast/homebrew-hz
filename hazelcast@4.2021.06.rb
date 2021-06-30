class HazelcastAT4202106 < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2021.06/hazelcast-4.2.1.tar.gz"
  sha256 "319db6dc5369dda74818414dcf9cc7d95d8dd1b7ec816bffc44aca2543fee3f5"

  bottle :unneeded

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
