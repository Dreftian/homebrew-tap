class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.7/tiancode-darwin-arm64.zip"
      sha256 "d23667bff3102b2086a0ea6347dcd88b00479f306a1ca086e0e47f522f525fc2"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.7/tiancode-darwin-x64.zip"
      sha256 "fdeccbc898820d14aa6ae783ec7a55cce218bfa7036a655ed341ef29b2194cfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.7/tiancode-linux-arm64.tar.gz"
      sha256 "3ecdf01fc2fa8d02ff66b0ef2a3eaf6d1604418b49dccde768ee31f9e812a251"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.7/tiancode-linux-x64.tar.gz"
      sha256 "119c4276edc8866bc447944cae5b5042ebd64efa7c183e9c182c20f463612434"
    end
  end

  def install
    bin.install "tiancode"
    libexec.install Dir["*"] if Dir["*"].any?
  end

  test do
    assert_match "1.0.7", shell_output("#{bin}/tiancode --version")
  end
end
