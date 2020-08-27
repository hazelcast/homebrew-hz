class Hazelcast < Formula
  desc "Tool to run Hazelcast IMDG member instances locally"
  homepage "https://github.com/hazelcast/hazelcast-command-line"
  url "https://github.com/hazelcast/hazelcast-command-line/releases/download/v4.2020.08.1/hazelcast-command-line-4.2020.08.1.tar.gz"
  sha256 "65d95a51fcdb108a90af750b601e9bb8a3ad8fa308ef54cb2536eae64bd73b3f"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hz"]
    prefix.install_metafiles
  end

end
