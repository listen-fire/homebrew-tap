class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.0"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0/lf-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "2bb3b3e0f476fd299793dc5e517cfe07c886532ca5eb86bf3e6cbb1496a2a953"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0/lf-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "b90d52a1491cf41ff1aefde06caf784dbd1c2bfd41915d5e3392d1a1db8c7918"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0/lf-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5476e51b010690b3610f1bfdbf2f6eced55658fbefd27ecd65557ccf469cda67"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0/lf-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91cc73ca1c947576f45c1e4a50a240febe58317e2eb73ec99279867f394d3ffa"
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
