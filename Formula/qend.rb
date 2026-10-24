# Template for JanaSundar/homebrew-tap. Do not edit the version or checksums by
# hand: scripts/update-distribution.sh fills them in from a published release's
# SHA256SUMS. "UNSET" means no release has been applied yet, and the formula
# will not install until it has.
#
# Each archive holds one directory, qend-vX.Y.Z-<target>/, with qend, LICENSE,
# NOTICE and README.md. Homebrew strips that directory when it unpacks.
# Supported: macOS (Apple silicon, Intel) and Linux (x86-64, arm64). Homebrew
# refuses other systems because no URL matches them.
class Qend < Formula
  desc "Peer-to-peer encrypted file transfer between your devices"
  homepage "https://github.com/JanaSundar/qend-releases"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/JanaSundar/qend-releases/releases/download/v#{version}/qend-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3b48a35251dbace19568f3d731b111fbbdbbc639cab5b95b31eff4bbf252ff24"
    end
    on_intel do
      url "https://github.com/JanaSundar/qend-releases/releases/download/v#{version}/qend-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "11bff2ba1b5b57c6221d0314992d4b05f832d8883e0b65f227249e59b4c89b3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JanaSundar/qend-releases/releases/download/v#{version}/qend-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "78eb02f75fc8e8b45e3b1d7acc32ff1471e2a802c52d68afff28f9bd9a3bdf94"
    end
    on_intel do
      url "https://github.com/JanaSundar/qend-releases/releases/download/v#{version}/qend-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2b2f3edb3eaa3644625bcc36011f776d5570c12064800683ec00a4719fd63284"
    end
  end

  def install
    bin.install "qend"
  end

  test do
    assert_equal "qend #{version}", shell_output("#{bin}/qend --version").strip
  end
end
