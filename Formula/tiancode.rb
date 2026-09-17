class Tiancode < Formula
  desc "Tiancode CLI: local-first agentic coding (terminal UI, server and web)"
  homepage "https://tiancode.vercel.app/"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-arm64.zip"
      sha256 "83a3afc7b395c35e806917afe068037df75888e84535c2acaedbde814825e7ec"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-darwin-x64.zip"
      sha256 "1a5e2bd2b932f313bcd5301d2f4204e80a33fea6763234ed7f8f4f6b36c0bc5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-arm64.tar.gz"
      sha256 "b0bd12e487e716aa137ce016081804d2709ca7d2049139ff8a094050e7bf7c34"
    else
      url "https://github.com/Dreftian/Tiancode/releases/download/v1.0.0/tiancode-linux-x64.tar.gz"
      sha256 "e178dd59af97e1dc49871f5927b80b0416073a233d61f2a5179d95e8c12bb157"
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
