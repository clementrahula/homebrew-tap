# auditor, in this project

<!-- covers: none -->

The role itself is shared and lives outside this repository, at `~/.claude/agents/auditor.md`.
If you have cloned this project that file will not be there, and nothing here depends
on it: what follows is a description of THIS repository's commands, paths and hazards,
which is useful on its own. Where both exist, this file wins.

There are no gates and no CI; that absence is the first finding.

Nothing here writes to the tree. `brew install --cask` DOES install software on this machine, so run it in a throwaway context or not at all during an audit.

What is worth checking: that every cask's version and checksum match a published artefact that still exists, and that no cask points at a URL that has moved.
