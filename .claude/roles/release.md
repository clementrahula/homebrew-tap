# release, in this project

<!-- covers: none -->

The role itself is shared and lives outside this repository, at `~/.claude/agents/release.md`.
If you have cloned this project that file will not be there, and nothing here depends
on it: what follows is a description of THIS repository's commands, paths and hazards,
which is useful on its own. Where both exist, this file wins.

The artefact is the cask definition itself; the application it installs is released elsewhere.

The channel is this repository on its default branch - Homebrew reads the tap directly, so a merge IS the release and there is no separate publish step.

Publishing is a push to the default branch.

Verify from outside by running `brew install --cask clementrahula/tap/lukotta` from a machine that has not got the tap cached, and confirming the version installed is the version meant.
