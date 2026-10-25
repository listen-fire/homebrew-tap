class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.4"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.4/lf-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "188756116710bce5b6e8ffcb385b8063a8aff8613310b747b93205cfd3f38459"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.4/lf-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "24e4cef9ec31bbff8258a9461953c711eb1c7d4c184504ba6bc6e953574bebde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.4/lf-v0.12.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f31594e77f090ec7879ecc180bf86962f5747dfaf4684feb69b8f5c0e9057e4"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.4/lf-v0.12.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c91a396adbe8026e154f2f57dd3964df4bf4ae28287c12e71f56fd0b22cfda16"
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
