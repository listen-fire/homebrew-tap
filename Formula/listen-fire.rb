class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.14.2"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.2/lf-v0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "fc4989080e818300dc949c0cdca62f33c0609431c9ed1f0150093b1823eb8e3a"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.2/lf-v0.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "0dd26f9ee6f6a7cbd682f08d500d955bd3347ba0b54650f17fda99490982a2f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.2/lf-v0.14.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "185b1d1eb3dd8f661d7522b332e5679fae62d84005b4d8e735a41ec425d77f71"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.2/lf-v0.14.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e27c0ad0d1ccbbbae848d7de533fe8c8f059dc247524e22469cba083b196c65"
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
