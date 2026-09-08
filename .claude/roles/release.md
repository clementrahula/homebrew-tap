# release, in this project

<!-- covers: none -->

The role itself is shared: `~/.claude/agents/release.md`, from the workflow repository.
This file is the part that is only true here, and it wins where the two disagree.

The artefact is the cask definition itself; the application it installs is released elsewhere.

The channel is this repository on its default branch - Homebrew reads the tap directly, so a merge IS the release and there is no separate publish step.

Publishing is a push to the default branch.

Verify from outside by running `brew install --cask clementrahula/tap/lukotta` from a machine that has not got the tap cached, and confirming the version installed is the version meant.
