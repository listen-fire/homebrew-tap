class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.16.0"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.0/lf-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "166028948496c8612bdab35351005d1fceed6bd493e12f05bac500f9d6215aca"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.0/lf-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "57f89866530b3fd7b0270a87e86100d3258e9c6412dff102b7116d7f0e9efb55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.0/lf-v0.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7e1358140f354d3ef647d2908eb3215b2e6b3132d3c1ccbc0355c06e0d1117fc"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.0/lf-v0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "19f48de65b4d00976884cadecbcefd8eec128589f86b79aacc17765ed9434267"
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
