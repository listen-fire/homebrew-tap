class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.15.2"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.2/lf-v0.15.2-aarch64-apple-darwin.tar.gz"
      sha256 "6c8c3da8fc4e95c3ea807e748310bd34eb0ee6293ea4d6cc10eebe6555f9e9b7"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.2/lf-v0.15.2-x86_64-apple-darwin.tar.gz"
      sha256 "99d0a01621d4028ce3e06e79611373c8e33a321b34048dba085fdebeb4555eff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.2/lf-v0.15.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6ec6ff60aab1f71d5473ceaaa64eed04acfb3bb46683d50d2b5cbe6e33ff9e69"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.15.2/lf-v0.15.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "334bfae17701404910158248d52dcf1f6e0c1be9c70e8a0ec918630150e158c5"
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
