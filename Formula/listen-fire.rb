class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.14.1"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.1/lf-v0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "9dd6e7fdfb98ef4fb25031142f2d536627d0267756cdcb30966caaeb2e21ca7e"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.1/lf-v0.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "371bddfe64cacb95fbecc95d3503632e88613f3f7485b04a892c8f0632f780ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.1/lf-v0.14.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f10882f41adb1a7bd70b9bd4c2ca4758e1c79e09d786ca4ee85b540276a5b047"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.14.1/lf-v0.14.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bcd71809b9ecbb9a460378da3cc5912519f2bce76021e1c7c229518a493d89cf"
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
