class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-arm64.zip"
      sha256 "2680597f8e872bfc7ff287496a7390779bfb8402a8dc108a28424bc96fc75ac7"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-x64.zip"
      sha256 "148837230d4024101e25766ec0606db5a96fb23a7d1d4118974f89b85779bd44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-arm64.tar.gz"
      sha256 "96e20c3811a2c197f097fd1f8fff20aa705be0fb95d26da1a50bb4dcbe5e4b4c"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-x64.tar.gz"
      sha256 "1d7ffffe7e8b1b5a3f489cb517638556002bd52adc0bef59170547a62caa5a22"
    end
  end

  def install
    bin.install "tiancode"
    libexec.install Dir["*"] if Dir["*"].any?
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/tiancode --version")
  end
end
