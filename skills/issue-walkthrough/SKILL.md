---
name: issue-walkthrough
description: >-
  Walk a newcomer through a GitHub issue before any code change. Fetch the
  ticket, name only the guidelines that apply, propose one branch from the
  repo's own convention, then explain the business problem, the technical
  problem, and the technical approach. Use when the user starts an issue,
  asks what an issue means, which guideline or branch to use, or says they
  are new to the system. Works in any repository.
---

# Issue walkthrough

Teach the issue. Do not edit code until the user asks to implement.

Answer only the layer they asked for. Offer the next layer in one sentence.

This skill has no project of its own. Read the repository you are in.

## Layers

### 1. Ticket and the rules that apply

Fetch the issue with `gh issue view <n> --json title,body,labels,state,url`. If they paste the ticket instead, use that text.

State the change in one paragraph: which files, which methods, what must stay untouched.

Then list only the rules that constrain this change. Read the repo's own guide and skip rules that do not apply. Look for `CLAUDE.md`, `AGENTS.md`, `CONTRIBUTING.md`, `.cursor/rules`, and `doc/`. For each rule you keep, say what it forces them to do on this ticket.

Name the test command and the schema check from that guide. If the guide names none, say so. Do not invent a command from another project.

### 2. Branch

Inspect recent local and remote branch names, and the base branch named in the repo guide. Match that pattern. Give one name and the commands to update the base branch and create it. Do not create the branch unless they ask.

### 3. Three explanations

When they ask what the issue means, give these three, in this order. Assume they do not know the domain.

#### Business problem

Who is hurt, what they were trying to do, what they see instead, and what the business loses. Use a short story with named parties and concrete ids taken from the ticket or the code. Show the rows or outcomes that should appear, and the ones that should not.

#### Technical problem

The wrong decision in the code. Name the files, the methods, and the condition that fails. Say what must stay untouched.

If they state a model of the data, check it against the schema and the caller. Correct it with the real relationship before the solution.

#### Technical solution

The approach only. Which layer owns the change. The rule that picks the new behavior. What not to change nearby, even when the same pattern exists there.

No patch. No new files. No commands that write code. Stop when the approach is clear.

### 4. Risk example

When the ticket is a vulnerability, show one bad value, the query or request that value produces, and the business effect. Then say whether a normal user can supply that value today, and where the value actually comes from.

Do not invent a stronger attack than the code path allows. A `SELECT` built with string pasting usually changes which rows come back. Do not claim it deletes data unless the driver runs stacked queries.

## Tone

- Lead with the direct answer.
- One idea per paragraph. Use a story when a definition is not landing.
- Keep code, paths, commands, and ids exact.
- Stop when the question is answered. Do not start the fix.
