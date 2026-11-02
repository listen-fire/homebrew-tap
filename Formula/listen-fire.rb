class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.13.0"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.0/lf-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "ccb2ccf28f6a91e662c1192559d7a4b01c43a29c2eafb20afd01f180b5ad4758"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.0/lf-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "6eedbdad4075c631a79ac9a229139542649ecac2b1b9d9f783e22f275b3a854e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.0/lf-v0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "572bf009577af96d794c9e4a9bc2e6543633879db61af08526d92aa60ab66aad"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.0/lf-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "921f38d554fe36177f55e85bdf5478d2a5cafbbbf9353f22b52f4d306938ed58"
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
