# skills

My personal library of agent skills. Works with any agent supported by the [`skills`](https://github.com/vercel-labs/skills) CLI (Claude Code, Cursor, Codex, ...).

## Install

```bash
# list what's available
npx skills@latest add farishamy-asiaquest/skills --list

# install everything / pick interactively
npx skills@latest add farishamy-asiaquest/skills
```

## Skills

| Skill | What it does |
|-------|--------------|
| [learn-explainer](skills/learn-explainer/SKILL.md) | Explain a PR, issue, or code flow as an interactive, self-contained HTML learning page |
| [issue-walkthrough](skills/issue-walkthrough/SKILL.md) | Walk a newcomer through a GitHub issue before any code change: rules, branch, business and technical problem, approach |

## Link skills locally

```bash
./link-skills.sh            # symlink every skill into ~/.claude/skills and ~/.cursor/skills
./link-skills.sh --force    # also replace differing local copies (old one kept as <name>.bak.<timestamp>)
```

## Adding a skill

1. Create `skills/<skill-name>/SKILL.md` with `name` and `description` frontmatter.
2. Put supporting files (templates, scripts, references) next to it.
3. Add a row to the table above.
4. Run `./link-skills.sh` to link it into your local agents.
