class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/hazelcast/hazelcast-member-tool"
  version "3.9.3_2"
  url "https://github.com/hazelcast/hazelcast-member-tool/raw/master/archive/hazelcast-member-#{version}.tar.gz"
  sha256 "518e942c21aa7effbc117a4dab5d0fbe9f8c864a3d17389e577947aa04777d89"

  depends_on "coreutils"
  depends_on :java => "1.7+"

  bottle :unneeded

  def install
    mkpath "#{etc}/hazelcast"
    libexec.install Dir["*"]
    etc.install_symlink "#{libexec}/etc/hazelcast.xml" => "hazelcast/hazelcast.xml"
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/utils.sh", "${var}", "#{var}"
    inreplace "#{libexec}/bin/utils.sh", "${etc}", "#{etc}"
    prefix.install_metafiles
    bash_completion.install "#{libexec}/bin/hazelcast-member-completion.sh" => "hazelcast-member"
  end

  def caveats
    <<-EOS
To enable tab completion add to your profile:
  if which hazelcast-member > /dev/null; then eval "$(hazelcast-member init -)"; fi
    EOS
  end
end
