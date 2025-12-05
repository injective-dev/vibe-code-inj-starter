# vibe-code-inj-starter

A starter repo for you to vibe code Injective projects with.
Optimised for [Roo](https://roocode.com/).
Configured for [building on Injective](https://docs.injective.network/developers/).

## Quick Start

- Set up
  - Install VS code
  - Install Roo (VS code plugin)
  - Configure Roo
    - API endpoint and key to access LLMs
    - Select model
  - Make a copy of this repo
    - `git clone git@github.com:injective-dev/vibe-code-inj-starter.git ./your-project-name`
    - `cd ./your-project-name`
    - In GitHub, create a new empty repo
    - `git remote rm origin`
    - `git remote add origin git@github.com:YOUR_GITHUB_USERNAME/YOUR_PROJECT_NAME.git`
    - `git push origin main`
- Review the following files:
  - Architecture: `/gen-ai/docs/architecture.md`
  - Product Requirements Document (PRD): `/gen-ai/docs/prd.md`
  - Task Plan: `/gen-ai/tasks/tasks.md`
  - Implementation: `/src/*` (will start off as empty)
- Research
  - Open Roo, and select the "Ask" Roo mode
  - If you ask it questions about Injective, it should use:
    - the "injective-docs" MCP server to retrieve documentation from the official Injective documentation
    - the "git-mcp" MCP server to retrieve code from select Injective repos
  - Use these answers to provide context when planning
- Planning
  - Open Roo, and select the "Architect" Roo mode
  - Enter prompts, respond to its questions, and detail your specifications
  - Review the updated architecture, PRD, and task plan files
  - If anything is missing or incorrect, fix them by:
    - either manually editing, or
    - using further prompts
- Implementation
  - Open Roo, and select the "Code" Roo mode
  - Enter prompts, respond to its questions, and detail your specifications
  - Code should be inserted into the `/src/` directory
  - Review the updated implementation, tests, et cetera
  - If anything is missing or incorrect, fix them by:
    - either manually editing, or
    - using further prompts

## Advanced

- Open Roo, and select the "Debug" Roo mode or "Orchestrator" Roo mode
  - If you have made it this far, you probably already have the skills to figure out how to use these modes on your own ;P

## Customisation

- Customise rules
  - Look in the `/.roo/rules` directory, and edit the general system prompt
  - Look in the `/.roo/rules-MODE_NAME` directories, and edit the specific system prompt for each Roo mode
- Customise templates
  - Look in `gen-ai/docs/architecture.md` for the technical architecture template, and edit
  - Look in `gen-ai/docs/prd.md` for the product requirements doc (PRD) template, and edit
  - Look in `gen-ai/tasks/tasks.md` for the task lists template, and edit
- Customise the Roo modes
  - Look in the `gen-ai/roo-modes/MODE_NAME.yaml` files, and edit the various attributes of each
  - In Roo, in settings for Roo modes, you can import these YAML files

If you do customise these files, and think that these would be valuable for other users,
please do contribute your changes to this repo by submitting a PR!

## Licence

MIT

## Author

[Brendan Graetz](https://blog.bguiz.com)
