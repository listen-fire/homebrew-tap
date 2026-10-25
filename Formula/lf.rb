class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.6"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.6/lf-v0.12.6-aarch64-apple-darwin.tar.gz"
      sha256 "87b0f81be56030e995808a843c6000f11c21f2e3f5d200f7cb910394a290fb82"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.6/lf-v0.12.6-x86_64-apple-darwin.tar.gz"
      sha256 "1c80daadb7722b70c28d66ab8663af029bbdedd986703d68c959d7b6b6419d2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.6/lf-v0.12.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "70e6f047285295c35d5fb8bfc9f3834ddc2cde3fa15cff5a8f48e4bcf3d18482"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.6/lf-v0.12.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9b491417958b68fb239526db0790b8e8bb728d7907489b751673f854795c031c"
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
