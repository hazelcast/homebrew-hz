class HazelcastAT4202103 < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2021.03/hazelcast-4.1.2.tar.gz"
  sha256 "b8162b630a7ea8072f79856702c1aa5258a162eb9e820b2da1756c3c203ab840"

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
