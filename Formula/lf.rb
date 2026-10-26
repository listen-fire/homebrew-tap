class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.9"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.9/lf-v0.12.9-aarch64-apple-darwin.tar.gz"
      sha256 "3e67f061b575b893ca7cdb9bcf1a9908048a225d3b8488ebf882479edabc795d"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.9/lf-v0.12.9-x86_64-apple-darwin.tar.gz"
      sha256 "e1fa6c7ed928db6e5a23d4f4837fbc08ab46316bca9327e0158df27b359db002"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.9/lf-v0.12.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d2eb35b1a687e238a9491e0ff99c9155a88cdfd4629d116e2e39256640c4b813"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.9/lf-v0.12.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e77e4303e618c80dbd5753c1a7c624f59cfa6d1eb2d8b260a36c17d561b28526"
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
