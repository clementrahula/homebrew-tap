cask "lukotta" do
  version "1.22.9"
  sha256 "4ba95d90def4239d34e15a89d01d12da46ab357c0c15fc15202ba7d49c1bf454"

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

  # Stopping the daemon is all an ordinary uninstall does here.
  #
  # The files it leaves in /Library belong to root, and Homebrew removes those
  # by shelling out to `sudo rm` -- which it does whether or not they are
  # there. Naming them here therefore asked for an administrator password on
  # every upgrade, on every Mac, including the ones where the daemon was never
  # set up and there was nothing to delete. `brew upgrade` cannot answer a
  # password prompt, so it did not upgrade; it failed.
  #
  # They belong under zap, which is the stanza for what only somebody asking to
  # be rid of the app entirely should pay for.
  uninstall launchctl: "com.lukotta.helper",
            quit:      "com.lukotta"

  # Everything the app keeps. The two under /Library need root and are why
  # `brew uninstall --zap` asks for a password; the rest are this user's own.
  # Saved passphrases are Keychain items rather than files, so they outlive
  # this -- the app's own uninstaller is what clears those.
  zap launchctl: "com.lukotta.helper",
      delete:    [
        "/Library/LaunchDaemons/com.lukotta.helper.plist",
        "/Library/PrivilegedHelperTools/com.lukotta.helper",
      ],
      trash:     [
        "~/Library/Application Support/com.lukotta",
        "~/Library/Caches/com.lukotta",
        "~/Library/HTTPStorages/com.lukotta",
        "~/Library/Preferences/com.lukotta.plist",
        "~/Library/Saved Application State/com.lukotta.savedState",
      ]
end
