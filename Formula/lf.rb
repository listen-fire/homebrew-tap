class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.1"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.1/lf-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "1e09ad05182de0dd09c921f8207e33cadafbcf2cd4cc24d729b186a746316b65"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.1/lf-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "1f7da6a6c0c907b3a849523efb58f46988d0442b7a13569198ada152c2992dc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.1/lf-v0.12.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "94e2cf0e326fa708cfa42d2eca4bd53e95913342b39bb96f2de4473adf1700b1"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.1/lf-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "22f03a289286fc8057512bbf2c6e609bb4d059041933c942515e083a48de6bb5"
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
