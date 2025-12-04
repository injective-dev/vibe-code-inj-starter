# vibe-code-inj-starter

A starter repo for you to vibe code Injective projects with.
Optimised for Roo.

## Quick Start

- Set up
  - Install VS code
  - Install Roo (VS code plugin)
  - Configure Roo
    - API endpoint and key to access LLMs
    - Select model
  - `rm src/.gitignore`
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
- Advanced
  - Open Roo, and select the "Debug" Roo mode or "Orchestrator" Roo mode
    - If you have made it this far, you probably already have the skills to figure out how to use these modes on your own ;P
  - Customise rules
    - Look in the `/.roo/rules` directory, and edit the general system prompt
    - Look in the `/.roo/rules-MODE_NAME` directories, and edit the specific system prompt for each Roo mode

## Licence

MIT

## Author

[Brendan Graetz](https://blog.bguiz.com)
