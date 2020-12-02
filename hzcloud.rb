class Hzcloud < Formula
  desc "Hazelcast Cloud Enterprise is an enterprise-grade, on-demand managed service for Hazelcast IMDG"
  homepage "http://cloud.hazelcast.com/"
  url "https://github.com/hazelcast/hazelcast-cloud-cli/archive/v1.2.2.tar.gz"
  sha256 "964b60f01149effca3074c1c3f83b2b1cf80bacf047d4a94b1c2177e9fa906c6"
  depends_on "go" => :build
  
  def install
      ENV["GOPATH"] = buildpath
      bin_path = buildpath/"src/github.com/hazelcast/hazelcast-cloud-cli"
      bin_path.install Dir["*"]
      cd bin_path do
        system "go", "build", "-ldflags", "-X github.com/hazelcast/hazelcast-cloud-cli/internal.Version=#{version} -X github.com/hazelcast/hazelcast-cloud-cli/internal.Distribution=BREW", "-o", bin/"hzcloud", "."
      end
  end

  test do
    system "false"
  end
end
