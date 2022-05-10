class Hzcloud < Formula
  desc "Hazelcast Cloud Enterprise is an enterprise-grade, on-demand managed service for Hazelcast IMDG"
  homepage "http://cloud.hazelcast.com/"
  url "https://github.com/hazelcast/hazelcast-cloud-cli/archive/v1.6.1.tar.gz"
  sha256 "f1bcc391e4ada78dcd54641661da380a32e2dab7f479dd3d2e33dcd78876d72e"
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
