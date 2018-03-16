class HazelcastMember < Formula
  desc "Command-line tool for running Hazelcast member instance(s)"
  homepage "https://github.com/hazelcast/hazelcast"
  url "https://github.com/hazelcast/hazelcast-member-tool/raw/master/archive/hazelcast-member-3.9.3.4.tar.gz"
  sha256 "d9204b986bcbc9aac984d267d23cc8d0a4f035a5dd1cf81e9943e8cd2ee1169d"

  bottle :unneeded

  depends_on "coreutils"
  depends_on :java => "1.7+"

  def install
    mkpath "#{etc}/hazelcast"
    libexec.install Dir["*"]
    etc.install_symlink "#{libexec}/etc/hazelcast/hazelcast.xml" => "hazelcast/hazelcast.xml"
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/utils.sh", "${var}", var.to_s
    inreplace "#{libexec}/bin/utils.sh", "${etc}", etc.to_s
    prefix.install_metafiles
    bash_completion.install "#{libexec}/bin/hazelcast-member-completion.sh" => "hazelcast-member"
  end

  def caveats
    <<~EOS
      To enable tab completion add to your profile:
        if which hazelcast-member > /dev/null; then eval "$(hazelcast-member init -)"; fi
    EOS
  end

  test do
    begin
      output = shell_output("#{bin}/hazelcast-member start --verbose -J -Dhazelcast.http.healthcheck.enabled=true")
      assert_match /ID:/, output
      sleep 3
      output = shell_output("#{bin}/hazelcast-member status")
      assert_match /Running/, output

      assert_match /Hazelcast::NodeState=ACTIVE/, shell_output("curl -s http://127.0.0.1:5701/hazelcast/health")
      output = shell_output("#{bin}/hazelcast-member stop")
      assert_match /shut down/, output
    ensure
      quiet_system "pkill", "-9", "-f", "hazelcast"
    end
  end
end
