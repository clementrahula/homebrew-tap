# implementer, in this project

<!-- covers: none -->

The role itself is shared and lives outside this repository, at `~/.claude/agents/implementer.md`.
If you have cloned this project that file will not be there, and nothing here depends
on it: what follows is a description of THIS repository's commands, paths and hazards,
which is useful on its own. Where both exist, this file wins.

There is no gate in this repository and no CI. `brew audit --cask` and `brew install --cask` against the local file are what actually check a change, and they must be run.

A cask names a version and a checksum. Both are facts about a published artefact, not values to be edited by hand into something plausible - a wrong checksum fails at install time on somebody else's machine.

There are no release notes here: the notes belong to the application this tap installs.
