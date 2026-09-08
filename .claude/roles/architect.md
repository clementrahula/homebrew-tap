# architect, in this project

<!-- covers: none -->

The role itself is shared and lives outside this repository, at `~/.claude/agents/architect.md`.
If you have cloned this project that file will not be there, and nothing here depends
on it: what follows is a description of THIS repository's commands, paths and hazards,
which is useful on its own. Where both exist, this file wins.

Plans go at the repository root; there is no `docs/` directory.

What failure costs here is **an install that does not work**, for everybody at once and at the moment they first try the product. A broken cask is the first thing a new user meets.

The constraint is Homebrew's own cask format and its rules about versions, checksums and upgrade behaviour. This repository holds nothing else, deliberately, and a proposal to add something to it is a proposal to change that.
