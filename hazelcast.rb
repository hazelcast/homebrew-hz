class Hazelcast < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2020.09/hazelcast-command-line-4.2020.09.tar.gz"
  sha256 "9849ea39f57b7ab82c9ab1ab142ad0bc5f6720424261f00a2e235f2e1222c0f1"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hz"]
    prefix.install_metafiles
  end

end
