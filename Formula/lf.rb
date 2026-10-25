class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.5"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.5/lf-v0.12.5-aarch64-apple-darwin.tar.gz"
      sha256 "83229e6de25e103349af33cd2e8e9d53e849c073bf8eee8a7b43660b841c650f"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.5/lf-v0.12.5-x86_64-apple-darwin.tar.gz"
      sha256 "4dd1f8c5d301f956a2f102fa93d729667eb07da7f43e296d9acd92b3bbb13589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.5/lf-v0.12.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b60224df33239ff0f023fdac76c465e251e2d14dedcbf61ba67c862d0a25023"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.5/lf-v0.12.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c06f6cb5c91d97b01a2e4bea24d7fe92c9490ba45f046000b3b1688d64f35552"
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
