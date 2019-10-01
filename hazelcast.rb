class Hazelcast < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v0.2-beta/hazelcast-command-line-0.2-beta.tar.gz"
  sha256 "04bd3768769e81d60adaf456361690668ed3e71b221a0224bb398ed9bd2eb93f"

  bottle :unneeded

  depends_on "coreutils"
  depends_on :java => "1.7+"

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hazelcast"]
    prefix.install_metafiles
  end

end
