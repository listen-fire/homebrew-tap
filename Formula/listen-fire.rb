class ListenFire < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.16.1"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.1/lf-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "5c146ecb56d9883828eac8b22b11406092c9890e573c969e4b48b35a10bccbcc"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.1/lf-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "dc31628828bc6efc7832b992b4678d888b44748908d612d935e3cf770ab23103"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.1/lf-v0.16.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "30048bbb46900bcb97f715735e1ca1391cd48387ea3daa2443f5d565f0636c9f"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.16.1/lf-v0.16.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3678cae200cbe9190eb412ef07b229fabeecd5b35e2e72eb0d2a862e00ed7da9"
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
