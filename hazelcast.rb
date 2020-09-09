class Hazelcast < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2020.09/hazelcast-command-line-4.2020.09.tar.gz"
  sha256 "b2a98a9a6d130d1c5a693b52640af0d721ce6c14e89b5be437a869d1207d901c"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hz"]
    prefix.install_metafiles
  end

end
