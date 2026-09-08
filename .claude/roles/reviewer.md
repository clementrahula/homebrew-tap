# reviewer, in this project

<!-- covers: none -->

The role itself is shared and lives outside this repository, at `~/.claude/agents/reviewer.md`.
If you have cloned this project that file will not be there, and nothing here depends
on it: what follows is a description of THIS repository's commands, paths and hazards,
which is useful on its own. Where both exist, this file wins.

**There is no gate and no pipeline.** A review rests on the diff and on `brew audit --cask` having been run; say plainly that no automated check exists rather than implying one passed.

Check the version and the checksum against the actual published artefact. Those are the two fields that break an install for everybody, and both look equally plausible when wrong.

The request host is **github**. There are no release notes.
