class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.0-rc.7"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.7/lf-v0.12.0-rc.7-aarch64-apple-darwin.tar.gz"
      sha256 "564bb2e9f8b230e2cfcb082d2bcff5e5bae59ea378d626cc03941f622f8d88e8"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.7/lf-v0.12.0-rc.7-x86_64-apple-darwin.tar.gz"
      sha256 "78acb0edf90392792e6cb78f2f86739c5aeeb1b8025c7ca87918bd917192c041"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.7/lf-v0.12.0-rc.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d54e51fb8f5aaddb21bf059f387761ddff1a4d140970b0dc1dd53876c71bb76f"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.7/lf-v0.12.0-rc.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e14905f373ee3dbeb0126bc807eec1b756362d05e0068b5fad69f803b17889c6"
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
