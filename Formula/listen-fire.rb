class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.15.3"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.3/lf-v0.15.3-aarch64-apple-darwin.tar.gz"
      sha256 "2ee2367f30a86422e368cf9aa8db7d7ab77d88f25c9f336ce9e0568173f691a7"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.3/lf-v0.15.3-x86_64-apple-darwin.tar.gz"
      sha256 "24f1ee640d78ca1818c1de9b96abdd363b2df2aee91e64160926be0a1fa7787e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.3/lf-v0.15.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4cf4524bc6e5b2b31e718eb95086a98695835fb8e6507815ba9be80e7d23e4fe"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.3/lf-v0.15.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "933755b1b2b071db80813040a53b032024b5924e3329822b339d96cd15a25308"
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
