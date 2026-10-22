class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.0-rc.8"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.8/lf-v0.12.0-rc.8-aarch64-apple-darwin.tar.gz"
      sha256 "990ba5e973e70bc2c3edb92fd813433cf130a1019780b5c7bbfd33c048194506"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.8/lf-v0.12.0-rc.8-x86_64-apple-darwin.tar.gz"
      sha256 "a812309619a58c753056d43e870a8c8494ca87cb68d3ff82be006fbe78b09917"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.8/lf-v0.12.0-rc.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c2fc3ab2b78bcc1bb6bad011aaacb21e35c5255cf199e0208f70f9bf9b47397"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.8/lf-v0.12.0-rc.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f324829edb14dc8579595812e6205b3de954b8302911c840bbed90193b97b0b1"
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
