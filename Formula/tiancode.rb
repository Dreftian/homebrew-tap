class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-arm64.zip"
      sha256 "cdc3530bfc9e5a3cf8dbf864bacf36c11ef8117b6bb1adb77aa281f810e33df7"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-x64.zip"
      sha256 "472cecbbd0cf6ea75eee232d1524f4855631f2633718da40e90575c85dc6a3fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-arm64.tar.gz"
      sha256 "0c2932f6316507b969fad82f56ba8aea8e3633e4fbbb64969a2ee37cd2e4aca8"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-x64.tar.gz"
      sha256 "50fa93a4aac2507a98afc732088245127dab4b429c803c6cdadce2299ab66a72"
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
