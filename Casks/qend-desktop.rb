# Template for JanaSundar/homebrew-tap. Do not edit the version or checksum by
# hand: scripts/update-distribution.sh fills them in from a published release's
# SHA256SUMS. "UNSET" means no release has been applied yet.
#
# The app is ad-hoc signed, not notarized. This cask does not remove the
# quarantine flag: macOS asks the user to confirm the first launch.
cask "qend-desktop" do
  version "0.8.0"
  sha256 "914b7d13f5c8d6bc715ef464dc8634a172a6e07446d9b2150ea9b48eaf7dfb8e"

  url "https://github.com/JanaSundar/qend-releases/releases/download/v#{version}/qend-desktop-v#{version}-macos-universal.dmg"
  name "Qend"
  desc "Peer-to-peer encrypted file transfer between your devices"
  homepage "https://github.com/JanaSundar/qend-releases"

  app "Qend.app"

  caveats <<~EOS
    Qend is not notarized by Apple yet. On first launch, right-click Qend in
    Applications and choose Open. On recent macOS versions, open System Settings
    → Privacy & Security and choose Open Anyway instead.
  EOS
end
