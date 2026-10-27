class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.12"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.12/lf-v0.12.12-aarch64-apple-darwin.tar.gz"
      sha256 "88e7404e8a1dd7c0d49ac3b5cfebdbe18b256001f96a21c48949b542f65da386"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.12/lf-v0.12.12-x86_64-apple-darwin.tar.gz"
      sha256 "5c046159c528d0118b56272eeeb3e95a58aee881231a1c6a7233ab1835c0ae25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.12/lf-v0.12.12-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a2690355a1342a67b54cc5039edcff24478ad957a5f8e0b6461bc7b6209738d1"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.12/lf-v0.12.12-x86_64-unknown-linux-musl.tar.gz"
      sha256 "056d1f949fd33dc774d30d4e6988a2587a0c29ac10591fff618431849b978f2a"
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
