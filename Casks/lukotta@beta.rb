cask "lukotta@beta" do
  version "1.22.0-beta.5"
  sha256 "87a661ce974c6caef5c1a331c68c05ac07e01eafb11ef449b6d2e022322c6d91"

  url "https://github.com/clementrahula/lukotta/releases/download/v#{version}/Lukotta-Beta.dmg",
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
  uninstall launchctl: "com.lukotta.beta.helper",
            quit:      "com.lukotta.beta"

  # Everything the app keeps. The two under /Library need root and are why
  # `brew uninstall --zap` asks for a password; the rest are this user's own.
  # Saved passphrases are Keychain items rather than files, so they outlive
  # this -- the app's own uninstaller is what clears those.
  zap launchctl: "com.lukotta.beta.helper",
      delete:    [
        "/Library/LaunchDaemons/com.lukotta.beta.helper.plist",
        "/Library/PrivilegedHelperTools/com.lukotta.beta.helper",
      ],
      trash:     [
        "~/Library/Application Support/com.lukotta.beta",
        "~/Library/Caches/com.lukotta.beta",
        "~/Library/HTTPStorages/com.lukotta.beta",
        "~/Library/Preferences/com.lukotta.beta.plist",
        "~/Library/Saved Application State/com.lukotta.beta.savedState",
      ]
end
