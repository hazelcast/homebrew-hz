class HazelcastAT42021026 < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/alparslanavci/hazelcast-command-line/releases/download/v4.2021.02.6/hazelcast-4.1.1.tar.gz"
  sha256 "5e4e276f2efc16058708d0b2bf910b587a908bdec05d90b9c4f1960f053f2001"

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
