class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-arm64.zip"
      sha256 "ed513e8a47c47c269c88491ad3e9a6757e450acbcb687000112a390cafb5e41c"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-x64.zip"
      sha256 "94c4a5fd89bb083cf7fa54fd551860983af364b193af7654df921cd40377f1d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-arm64.tar.gz"
      sha256 "b42621dd444d239143732e13a6441b09168b68ebc6fd51b4bfec49a18ef1b9aa"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-x64.tar.gz"
      sha256 "6f2e753ce369bf1f97907ebe701f1e75290cb39d35fa738714b0b40f1e227720"
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
