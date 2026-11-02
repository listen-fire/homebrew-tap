class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.14.0"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.0/lf-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "ecdd16cea6d8031d4258ad7aa6d2a3360d324c91730685577453780d1ee03ab9"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.0/lf-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "5a4b9d889963a2f7acedfe138f0033a2e0bda72f11ca0701d83a0af8ef907716"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.0/lf-v0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "10d9e67772b6b1e576971733d47886532ded8fe4a04686f8681074ce773ed777"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.0/lf-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "863a4f30a12e1f8a6dd66edabcace3313189ae273e2d7b60a224497b6b13417f"
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
