cask "lukotta" do
  version "1.19.0"
  sha256 "a0df871a3380d73ead6cb8f7dacfd38434d1c35e92e0e4457f5ec162e6a498d4"

  url "https://github.com/clementrahula/lukotta/releases/download/v#{version}/Lukotta.dmg",
      verified: "github.com/clementrahula/lukotta/"
  name "Lukotta"
  desc "Opens BitLocker, LUKS and NTFS drives and disk images in Finder"
  homepage "https://lukotta.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app carries Sparkle and updates itself. Without this, Homebrew treats a
  # version it did not install as damage and reinstalls over it.
  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Lukotta.app"

  # The privileged daemon, which needs root to remove and so cannot be taken
  # away by the app once the app itself has gone. Nothing here is reached on a
  # Mac where the daemon was never set up.
  uninstall launchctl: "com.lukotta.helper",
            delete:    [
              "/Library/LaunchDaemons/com.lukotta.helper.plist",
              "/Library/PrivilegedHelperTools/com.lukotta.helper",
            ]

  # Everything the app keeps, all of it under its own identifier. Saved
  # passphrases are Keychain items and are not files, so they outlive this;
  # the app's own uninstaller is what clears those.
  zap trash: [
    "~/Library/Application Support/com.lukotta",
    "~/Library/Caches/com.lukotta",
    "~/Library/HTTPStorages/com.lukotta",
    "~/Library/Preferences/com.lukotta.plist",
    "~/Library/Saved Application State/com.lukotta.savedState",
  ]
end
