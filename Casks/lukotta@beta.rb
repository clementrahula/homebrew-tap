cask "lukotta@beta" do
  version "1.19.2"
  sha256 "72dc1b57e8f18fc8c80a1c289fdcb86316da2190674d29e2f328d6cea2301129"

  url "https://github.com/clementrahula/lukotta/releases/download/v#{version}-beta/Lukotta-Beta.dmg",
      verified: "github.com/clementrahula/lukotta/"
  name "Lukotta Beta"
  desc "Opens BitLocker, LUKS and NTFS drives and disk images in Finder"
  homepage "https://lukotta.com/"

  livecheck do
    url :url
    strategy :github_releases
  end

  # The app carries Sparkle and updates itself. Without this, Homebrew treats a
  # version it did not install as damage and reinstalls over it.
  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Lukotta Beta.app"

  # The privileged daemon, which needs root to remove and so cannot be taken
  # away by the app once the app itself has gone. Nothing here is reached on a
  # Mac where the daemon was never set up.
  uninstall launchctl: "com.lukotta.beta.helper",
            delete:    [
              "/Library/LaunchDaemons/com.lukotta.beta.helper.plist",
              "/Library/PrivilegedHelperTools/com.lukotta.beta.helper",
            ]

  # Everything the app keeps, all of it under its own identifier. Saved
  # passphrases are Keychain items and are not files, so they outlive this;
  # the app's own uninstaller is what clears those.
  zap trash: [
    "~/Library/Application Support/com.lukotta.beta",
    "~/Library/Caches/com.lukotta.beta",
    "~/Library/HTTPStorages/com.lukotta.beta",
    "~/Library/Preferences/com.lukotta.beta.plist",
    "~/Library/Saved Application State/com.lukotta.beta.savedState",
  ]
end
