class Lf < Formula
  desc "Listen-Fire: the movement language and its local runner"
  homepage "https://github.com/listen-fire/listen-fire"
  version "0.12.0-rc.10"
  license "Apache-2.0"

  # The built-in modules are TypeScript and need Node once a system is connected.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.10/lf-v0.12.0-rc.10-aarch64-apple-darwin.tar.gz"
      sha256 "a46526d7cde6c860e48b5f9eaa12b01405794533079561b978e5039a88801061"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.10/lf-v0.12.0-rc.10-x86_64-apple-darwin.tar.gz"
      sha256 "73ad7fa25e324ed532dc945f822a41a2344cbeb8c0a5c71fc613f5cc7e9f3709"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.10/lf-v0.12.0-rc.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "09ce2099782fae4cad9f81f8ed43f876712938f6911791944ece1e81ec3a82c5"
    end
    on_intel do
      url "https://github.com/listen-fire/listen-fire/releases/download/lf-v0.12.0-rc.10/lf-v0.12.0-rc.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e6c0c455102f3f43f5a178a6419bc7dd0d02e62a8f2871d2f68335eea1422199"
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
