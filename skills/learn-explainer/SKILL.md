---
name: learn-explainer
description: Explain a PR, issue, feature, or code flow as an interactive visual HTML page filed in a local learning hub. Use when the user asks to "explain PR #N", "help me understand X", or wants a graphical knowledge interface / learning page.
---

# Learn Explainer

Turn a PR, issue, or piece of system logic into a self-contained, interactive HTML page the user can open in a browser, filed in a growing knowledge hub.

## Where files go

- **Hub root**: use the path the user or the project's `CLAUDE.md` / `AGENTS.md` names. If none is given, use `~/learning-hub/` (create if missing) and tell the user. Never put these files inside the code repository being explained.
- One folder per topic: `pr-<number>/`, `issue-<number>/`, or `topic-<kebab-name>/`, each with its own `index.html`.
- Hub page `<hub-root>/index.html`: add one `<a class="card">` entry per topic (title, one-line summary, tags). Keep existing entries; copy the card style already in the file. If the hub page does not exist yet, create it with a simple responsive card grid in the same visual style as the template.

## Steps

1. **Gather facts first.** For a PR: `gh pr view N --json title,body,headRefName,baseRefName,files,state` and `gh pr diff N`. For an issue: `gh issue view N`. Read the surrounding code the change relies on (called functions, callers, views). Never explain from the PR description alone; check it against the code.
2. **Understand before drawing.** Be able to state the problem, root cause, fix, and risk in plain words. Use numbers from the PR only when the PR or code supports them.
3. **Write the page** using `templates/example-pr.html` (in this skill's folder) as the style and structure reference. Copy its CSS and nav approach; replace the content. The template explains a fictional PR; do not carry any of its facts over.
4. **Update the hub index.**
5. **Tell the user how to open it.** Give the file path and a way to open it that fits their platform:
   - macOS: `open <path>/index.html`
   - Linux: `xdg-open <path>/index.html`
   - Windows with WSL: `explorer.exe "$(wslpath -w <path>/index.html)"` (a Linux path pasted into a Windows browser does not work)
   - Any platform: `cd <hub-root> && python3 -m http.server 8099`, then `http://localhost:8099/`
6. In the reply, give a short text summary too (problem, fix, what is still open), and say honestly that the page was not viewed in a browser unless it was.

## Page structure (adapt per topic)

1. **One-sentence version** + 3 headline stat cards (before / after / target).
2. **Concepts**: cards defining each domain term the reader needs.
3. **Flow diagram**: boxes for the request path (for example controller → service → data layer → helper → view), highlighting what changed (red = hot spot, green = new).
4. **Interactive simulator**: a small, step-through demo of the core logic (Step / Run all / Reset). Label it as a simplified model, not the real code.
5. **Code before/after**: side-by-side pseudo-code, plus a list of details worth noticing.
6. **Scale or impact**: a slider or bars showing why the change matters.
7. **Risk table, tests, what is not fixed.**
8. **Quiz**: 4-6 multiple-choice questions with instant feedback.

Drop sections that do not fit (a pure refactor may have no scale slider), but always keep: one-sentence summary, concepts, flow, and at least one interactive element.

## Technical rules

- Single self-contained `index.html`: inline CSS and JS, no external scripts, fonts, or CDNs, so it works offline from `file://`.
- Support light and dark with CSS variables and `prefers-color-scheme`.
- Responsive; wide tables and code in `overflow-x:auto` containers.
- Plain, simple English; define jargon on first use. The reader is a developer learning the system, not necessarily an expert in its language or framework.
- Do not embed secrets, production data, or customer data.
