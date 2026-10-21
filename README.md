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

## Adding a skill

1. Create `skills/<skill-name>/SKILL.md` with `name` and `description` frontmatter.
2. Put supporting files (templates, scripts, references) next to it.
3. Add a row to the table above.
