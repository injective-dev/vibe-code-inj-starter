# Rules for all Roo Modes

## AI Collaboration & Prompting

- Clear Instructions
   - Provide explicit directives with defined outcomes, constraints, and contextual information.
- Context Referencing
   - Regularly reference previous stages and decisions stored in the memory bank.
- Suggest vs. Apply
   - Clearly indicate whether AI should propose ("Suggestion:") or directly implement changes ("Applying fix:").
- Critical Evaluation
   - Thoroughly review all agentic outputs for accuracy and logical coherence.
- Focused Interaction
   - Assign specific, clearly defined tasks to AI agents to maintain clarity.
- Leverage Agent Strengths
   - Utilise AI for refactoring, symbolic reasoning, adaptive optimisation, and test generation; human oversight remains on core logic and strategic architecture.
- Incremental Progress
   - Break complex tasks into incremental, reviewable sub-steps.
- Standard Check-in
   - Example: "Confirming understanding: Reviewed [context], goal is [goal], proceeding with [step]."

## Project Context & Understanding

- Documentation First
   - Review essential documentation before implementation:
     - README.md
     - gen-ai/docs/prd.md (Product Requirements Document (PRD))
     - gen-ai/docs/architecture.md (Technical -Architecture)
     - gen-ai/tasks/tasks.md (Tasks to be done)
   - Request clarification immediately if documentation is incomplete or ambiguous.
- Architecture Adherence
   - Follow established module boundaries and architectural designs.
   - Validate architectural decisions using symbolic reasoning; propose justified alternatives when necessary.
- Pattern & Tech Stack Awareness
   - Utilse documented technologies and established patterns; introduce new elements only after clear justification.
