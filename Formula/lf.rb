class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.10"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.10/lf-v0.12.10-aarch64-apple-darwin.tar.gz"
      sha256 "abcd441d92a8d16ab32f7a2ab6af6b148c4674938f5816a7fc2750b60a13ccc2"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.10/lf-v0.12.10-x86_64-apple-darwin.tar.gz"
      sha256 "ae3b832ce0c9d0da81658c4174ae2178fc576ac10d14a74cbd09683691e05afd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.10/lf-v0.12.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7bd9e7835b780951557a7fd5bbe6256f756654a8218dff4c59fe26cc70f35dfd"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.10/lf-v0.12.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "49d0049b1124276d275529c7aa07195885e5b750a0152fa104c112ae55b59c93"
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
