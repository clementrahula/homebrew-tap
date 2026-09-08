# architect, in this project

<!-- covers: none -->

The role itself is shared: `~/.claude/agents/architect.md`, from the workflow repository.
This file is the part that is only true here, and it wins where the two disagree.

Plans go at the repository root; there is no `docs/` directory.

What failure costs here is **an install that does not work**, for everybody at once and at the moment they first try the product. A broken cask is the first thing a new user meets.

The constraint is Homebrew's own cask format and its rules about versions, checksums and upgrade behaviour. This repository holds nothing else, deliberately, and a proposal to add something to it is a proposal to change that.
