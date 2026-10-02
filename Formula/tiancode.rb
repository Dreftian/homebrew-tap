class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.6/tiancode-darwin-arm64.zip"
      sha256 "8aca4cf2a0803a7d78098b93ee0d16cf0a26551e5b47907d1662bca1653611f6"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.6/tiancode-darwin-x64.zip"
      sha256 "c167186e47e7d3166f52c8bde0219644da6c72d6397e080d8c29bbd92f760238"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.6/tiancode-linux-arm64.tar.gz"
      sha256 "62cc731318b0682c5afd56f7f2e7eb9e6dd0a21370670010765190e78c16f7ea"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.6/tiancode-linux-x64.tar.gz"
      sha256 "408045d068c934e2a996966095e6f57be69bd63b20a2a5bf5597cc4b1732ac33"
    end
  end

  def install
    bin.install "tiancode"
    libexec.install Dir["*"] if Dir["*"].any?
  end

  test do
    assert_match "1.0.6", shell_output("#{bin}/tiancode --version")
  end
end
