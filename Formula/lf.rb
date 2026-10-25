class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.3"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.3/lf-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "941ee198490d28a010ae8610727dbf5e5758260da960bc6f1130d2ba8f079a97"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.3/lf-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "7d907f553ecaac475af0019fbb0deeae49d43c3c780cc2167215880a807b9280"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.3/lf-v0.12.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ee5968b0d4da984650d641f811ca82d5d5da0dc204e12cf8d239ba1c54639a6e"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.3/lf-v0.12.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3a3028452c386039cadf7f4963d5d5f709db4dd1b28d8453b16e06f590317f09"
    end
  end

  def install
    # bin/ and share/ stay together: lf finds its modules at <prefix>/share/lf/modules.
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lf --version")
  end
end
