class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-arm64.zip"
      sha256 "6290938bf8fe9e1bcf52e914550d3336e219496fd7a02104e4b2b41cb3b85fc6"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-x64.zip"
      sha256 "bcc04e953ed1a5c83c4f8a79f08b22f070af6ddfcbb9df5145b3a33ad40c8411"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-arm64.tar.gz"
      sha256 "4111e9e443eb51dc708841943421bd123937b0c0026e87c875404f77e8540af6"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-x64.tar.gz"
      sha256 "ccbd4e64d373d61dcc26d679a5bee2773778c6312e88f31fb767f2521d709e02"
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
