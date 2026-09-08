# auditor, in this project

<!-- covers: none -->

The role itself is shared: `~/.claude/agents/auditor.md`, from the workflow repository.
This file is the part that is only true here, and it wins where the two disagree.

There are no gates and no CI; that absence is the first finding.

Nothing here writes to the tree. `brew install --cask` DOES install software on this machine, so run it in a throwaway context or not at all during an audit.

What is worth checking: that every cask's version and checksum match a published artefact that still exists, and that no cask points at a URL that has moved.
