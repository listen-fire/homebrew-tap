class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.0-rc.6"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.6/lf-v0.12.0-rc.6-aarch64-apple-darwin.tar.gz"
      sha256 "41bd6d2b24853d7d4026844c9e3a663c3bfd7a5388b7e08f65d3422c76c2e81e"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.6/lf-v0.12.0-rc.6-x86_64-apple-darwin.tar.gz"
      sha256 "db9c731a43cdd4c9ee32092a43ae0f2d60ca0ee88bb3f4834ac46277a35c4ea8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.6/lf-v0.12.0-rc.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "96b383cf682e115e6b59a9ee5ad5ecfe98499a0ac9b5fe2fd45f5a9d15550127"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.6/lf-v0.12.0-rc.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d17be3d5daaac8b339d6334180ccbd15ad3fa6239dfabbe7a9851c61a23aa8c3"
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
