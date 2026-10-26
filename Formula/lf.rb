class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.7"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.7/lf-v0.12.7-aarch64-apple-darwin.tar.gz"
      sha256 "48d560cce0a2d09ba36b726fe1feb5e77a9ba0242eb9723ff06a19cc3ee9beb9"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.7/lf-v0.12.7-x86_64-apple-darwin.tar.gz"
      sha256 "b4e3f303f70995fe42a68e5105eae2a30fdeb6893e2365cc1d8c2f53de64d98a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.7/lf-v0.12.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b4de0f9e9c2de8719ee630b10bfd8493862587679db982780318bdf0e17a7c4b"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.7/lf-v0.12.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1ff23739bef08adc334c5ad705f49f9d3149e758c3b407cbdf95720e392bc4f9"
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
