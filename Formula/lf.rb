class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.2"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.2/lf-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "0ff6e29298c2a9a072bb1a7e59cac41739fb55bc14a71c609cb274517d8113e0"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.2/lf-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "18199d6d30691d622ddbdd1f12f601a7324c23c293937c43707a10d18c23d038"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.2/lf-v0.12.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "66c69c44d23877a588f132dfdcc6534b85f3dc32dbf8d4be201d6507bdcc81eb"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.2/lf-v0.12.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c803e6c8358bd645919c0bd7635651c309b25d84cbee33eb1b3a18ec21de7659"
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
