class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.13"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.13/lf-v0.12.13-aarch64-apple-darwin.tar.gz"
      sha256 "3a7bee76f268150fb212ae3bf7ff87977d6c5cf8255428940a7755c39e6b2ab0"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.13/lf-v0.12.13-x86_64-apple-darwin.tar.gz"
      sha256 "ff848cd5d0d4c8cd48a2a521ce5ee27b2e5865856179f713a7cfb569a3cb0ae6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.13/lf-v0.12.13-aarch64-unknown-linux-musl.tar.gz"
      sha256 "26a0ad21c42aa1c6b09caa2de4b1a7f09aafa566de2b30557e173ff82f9051fc"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.13/lf-v0.12.13-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eb133f777035ad5390fe9786d46e4f07bba0ffcc6e3762bf6b0d215e11f08cb3"
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
