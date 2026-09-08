# implementer, in this project

<!-- covers: none -->

The role itself is shared: `~/.claude/agents/implementer.md`, from the workflow repository.
This file is the part that is only true here, and it wins where the two disagree.

There is no gate in this repository and no CI. `brew audit --cask` and `brew install --cask` against the local file are what actually check a change, and they must be run.

A cask names a version and a checksum. Both are facts about a published artefact, not values to be edited by hand into something plausible - a wrong checksum fails at install time on somebody else's machine.

There are no release notes here: the notes belong to the application this tap installs.
