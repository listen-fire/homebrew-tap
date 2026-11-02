class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.13.1"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.1/lf-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "898801948bc7a761695bfcbe65ad9d071efb1ca7691f4b28dc91642d6c218984"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.1/lf-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "3b246aec405dd2179fe3ad0738d96a3bb2b0dfb58f972ddfa603d6ddc8af52dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.1/lf-v0.13.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8359b82a3e09fa782c0b12a017575fec81b0f7216ec421e5370de37aedbfdea6"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.13.1/lf-v0.13.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9573b6ad92629bf579ffa49d9bac29cbc9516cdc048e0052b679a2829b85ea86"
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
