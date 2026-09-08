# reviewer, in this project

<!-- covers: none -->

The role itself is shared: `~/.claude/agents/reviewer.md`, from the workflow repository.
This file is the part that is only true here, and it wins where the two disagree.

**There is no gate and no pipeline.** A review rests on the diff and on `brew audit --cask` having been run; say plainly that no automated check exists rather than implying one passed.

Check the version and the checksum against the actual published artefact. Those are the two fields that break an install for everybody, and both look equally plausible when wrong.

The request host is **github**. There are no release notes.
