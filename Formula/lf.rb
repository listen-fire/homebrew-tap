class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.8"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.8/lf-v0.12.8-aarch64-apple-darwin.tar.gz"
      sha256 "019fe4b24c00e3d752f95659e91aac5f5b858a6b2efd0f4ee6122f499ecdebfa"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.8/lf-v0.12.8-x86_64-apple-darwin.tar.gz"
      sha256 "264adc8355a4cbaf403ddcd0578d53a49a1f1edad3afa4e53bb8751b759a2ca7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.8/lf-v0.12.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6515fe165dfd1e9aa4a8fa614d2d6a57cfca3ce50fa09ac768bba191f64cde47"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.8/lf-v0.12.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bffc5180a3893c2e5eab8440d744b4fa175579d860c64ee07b5b4fc5d804f2b7"
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
