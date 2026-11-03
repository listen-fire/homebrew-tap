class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.15.0"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.0/lf-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "182113c31ce9e8a17653ab064ac18efc2343569e4c13c7fb4d79d74d6b4f72c1"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.0/lf-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "704006e625870473967b8b6dc068cba9d913aebd7409b4324769a52b78202662"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.0/lf-v0.15.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "50bdb41eef41afe8e3b7dbd073316923fbbe9cda05ce0e77b38e36d4afad267e"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.0/lf-v0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ba0fbf1a64a53179c070fcc28dc92cda51d969f783712cdc37a59ba07fe4563"
    end
  end

  def install
    # bin/ and share/ stay together: listen-fire finds its modules at <prefix>/share/lf/modules.
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/listen-fire --version")
  end
end
