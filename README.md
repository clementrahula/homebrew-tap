# Lukotta's Homebrew tap

[Lukotta](https://github.com/clementrahula/lukotta) opens BitLocker, LUKS and
NTFS drives and disk images in Finder. This repository is how it is installed
with Homebrew, and holds nothing else.

## Installing

```bash
brew install --cask clementrahula/tap/lukotta
```

The pre-release, which has its own identifier and its own update feed and can
sit beside the released app on one Mac:

```bash
brew install --cask clementrahula/tap/lukotta@beta
```

Both are Apple Silicon only and need macOS Sequoia or later.

## Updating

The app carries Sparkle and updates itself, so it will usually be ahead of
what Homebrew last installed. That is expected: the casks are marked
`auto_updates true`, which stops Homebrew treating a version it did not
install as damage and putting an older one back over it.

`brew upgrade` still works and moves the cask's own record forward.

## Removing

```bash
brew uninstall --cask clementrahula/tap/lukotta
```

That stops the background daemon and removes the app.

It asks for an administrator password if the background daemon was ever set up.
Stopping a daemon that runs as root needs root, and Homebrew asks the system for
it. Where the daemon was never set up, there is nothing to stop and nothing is
asked.

The daemon leaves two files under `/Library` that belong to root, along with
this Mac's own settings and caches. Those go with:

```bash
brew uninstall --zap --cask clementrahula/tap/lukotta
```

which asks for an administrator password, because removing root's files needs
one. Saved passphrases are Keychain items rather than files and outlive both:
the app's own uninstaller, in its menu, is what clears those.

## Why a tap

Homebrew's own cask repository judges an application on how widely known it is
rather than on what it does, and Lukotta is not widely known. The cask here is
the same file either way and moves across unchanged if that stops being true.

## Where these come from

`scripts/release.sh` in the app's repository writes each cask from the disk
image it has just published, so the version and the checksum are the ones that
were actually released. Neither is edited by hand.
