class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.15.1"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.1/lf-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "1ea4978e950be4b954f4c46ad39108cb62a21890184b987e45e200e2b840ba04"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.1/lf-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "d1edb5ee53e440fc80551216e58a0abeb41796d16e1131c75ddf7f84c3c51262"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.1/lf-v0.15.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f66bd0389b01e8b7d44b876d3fd9dc4d4415709dda74273ab38ebe2b9d05e155"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.1/lf-v0.15.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1c380c3a2bd28427f3d0c9b183b9c6405cdad7d235265d3522876042419d42ad"
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
