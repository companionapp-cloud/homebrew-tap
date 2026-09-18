# Homebrew cask for the Companion desktop app (macOS).
#
# This file is the SOURCE for companionapp-cloud/homebrew-tap: the Release workflow
# (.github/workflows/release.yml, `homebrew-tap` job) stamps `version` and `sha256`
# from the freshly built release asset, then pushes the whole ../homebrew folder to
# the tap repo. Edit it here, never in the tap repo directly.
#
# The bundle is ad-hoc signed and not notarized, so install with --no-quarantine to
# skip Gatekeeper:
#
#   brew install --cask --no-quarantine companionapp-cloud/tap/companion
cask "companion" do
  version "0.6.0"
  sha256 "4e9a847bbdc37f6b75e36d4319a45ecb26d873c8dc5fa670f158a981fbe452c6"

  url "https://github.com/companionapp-cloud/companion/releases/download/v#{version}/Companion-#{version}-macos-universal.zip"
  name "Companion"
  desc "Local-first notes, chats and canvas with a private sync server"
  homepage "https://github.com/companionapp-cloud/companion"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The build is not notarized; Homebrew's auto-update check would see nothing.
  auto_updates false
  depends_on macos: ">= :big_sur"

  app "Companion.app"

  zap trash: "~/Library/Application Support/Companion"
end
