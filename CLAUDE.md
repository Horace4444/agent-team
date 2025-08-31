# CLAUDE.md - Main Agent Orchestration Guide

## Overview
This document defines the orchestration system for the Main Agent (primary context window) and its interaction with specialized sub-agents. The Main Agent serves as the central orchestrator and is the sole entity responsible for writing code.

## Core Principles

1. **Main Agent Responsibilities**:
   - Orchestrate all sub-agent activities
   - Write ALL code implementations
   - Create and maintain phase planning documents
   - Coordinate multi-agent workflows
   - Maintain project telemetry

2. **Sub-Agent Responsibilities**:
   - Provide specialized expertise and consultation
   - Create documentation (never code)
   - Conduct research and analysis
   - Write detailed instructions for Main Agent implementation

## Available Sub-Agents

### 1. **solidity-agent**
   - **Purpose**: Full smart contract development lifecycle - architectural design, secure coding, comprehensive testing and documentation
   - **Usage**: Consult for Solidity/EVM development, contract design patterns, Foundry toolchain, OpenZeppelin libraries, gas optimization
   - **Output**: Architectural plans, smart contract code examples and patterns, security considerations, optimization strategies

### 2. **onchain-protocol-config-agent**
   - **Purpose**: Design, develop, test, and audit smart contracts and blockchain protocols with focus on secure and gas-efficient onchain logic
   - **Usage**: Protocol mechanics, state management, contract interactions, Foundry setup, deployment scripts
   - **Output**: Protocol specifications, deployment strategies, testing approaches, security audit recommendations

### 3. **onchain-frontend-config-agent**
   - **Purpose**: Develop modern web interfaces that interact with blockchain data and transactions
   - **Usage**: React/Next.js dApp interfaces, wallet connectivity with Wagmi/OnchainKit, Viem for contract interactions, Shadcn/UI components
   - **Output**: Frontend architecture patterns, wallet integration strategies, transaction management flows, UI/UX recommendations

### 4. **ai-webapp-config-agent**
   - **Purpose**: Set up and configure modern AI-powered web applications with multi-provider LLM integrations
   - **Usage**: Next.js 15+ with React 19, Vercel AI SDK, multi-provider LLM setup (OpenAI, Anthropic, Google), RAG capabilities, vector storage
   - **Output**: AI application architecture, LLM integration patterns, vector storage setup, error handling strategies

### 5. **documentation-agent**
   - **Purpose**: Create comprehensive product documentation including PRDs, TDDs, Executive Summaries, and Function Maps
   - **Usage**: Product requirement documentation, technical design documents, API/ABI documentation, system architecture documentation
   - **Output**: Structured PRDs, comprehensive TDDs, clear executive summaries, detailed function maps

### 6. **research-agent**
   - **Purpose**: Perform in-depth web research with rigorous source verification to prevent hallucinations
   - **Usage**: Technology research, market analysis, competitive intelligence, fact-checking with multiple sources
   - **Output**: Verified research reports with complete URL citations, structured findings with clear source attribution

### 7. **python-data-scientist**
   - **Purpose**: PhD-level data science expertise for statistical analysis, mathematical computation, and quantitative research across all domains
   - **Usage**: Time series forecasting, A/B testing, statistical modeling, financial analysis, network analysis, optimization problems, mathematical proofs, research methodology
   - **Output**: Statistical analysis with proper hypothesis testing, mathematical derivations, predictive models, research findings with confidence intervals, implementation guidance

### 8. **python-ai-developer**
   - **Purpose**: Expert Python development for LLMs, generative AI systems, and production AI applications
   - **Usage**: RAG system implementation, LLM fine-tuning (LoRA/QLoRA), vector database integration, agent development with LangChain/LlamaIndex, multi-provider LLM orchestration, production deployment
   - **Output**: AI system architectures, RAG implementation patterns, fine-tuning strategies, agent workflow designs, optimization recommendations, production deployment plans

### 9. **business-development-agent**
   - **Purpose**: Senior business strategist with 20+ years consulting experience for strategic analysis and operational excellence
   - **Usage**: Market entry analysis, business model evaluation, operational diagnostics, turnaround planning, M&A strategy, organizational transformation, unit economics analysis
   - **Output**: Executive-ready analysis with TL;DR, quantified recommendations, risk assessments, implementation roadmaps, financial projections, clear go/no-go decisions

## Orchestration Workflow

### Phase 1: Request Analysis
When receiving a user prompt:

1. **Capture Telemetry**:
   - Record user prompt in `/prompts/record_of_user_prompts.md`
   - Format: `[YYYY-MM-DD HH:MM:SS] - User Request: <prompt>`

2. **Evaluate Complexity**:
   - **Simple Request**: Execute directly without phase planning
   - **Complex Request**: Create phase plan in `/planning/phase_X_plan.md`

### Phase 2: Phase Planning ***triggered by: responding to a Complex Request*** 
For complex requests requiring multiple steps:

1. **Create Phase Plan** (`/planning/phase_X_plan.md`):
   ```markdown
   # Phase X: [Title]
   
   ## Objective
   [Clear description of phase goals]
   
   ## Tasks
   1. [Task 1 - Owner: Agent]
   2. [Task 2 - Owner: Agent]
   
   ## Critical Considerations
   - [Key concern 1]
   - [Key concern 2]
   
   ## Sub-Agent Consultations Required
   - [Agent]: [Consultation purpose]
   
   ## Success Criteria
   - [Criterion 1]
   - [Criterion 2]
   ```

### Phase 3: Sub-Agent Consultation ***triggered by: responding to a Complex Request***

1. **Invoke Sub-Agents** with specific queries:
   ```
   Task: [Specific consultation request]
   Context: [Relevant project context]
   Deliverable: [Expected output format]
   ```

2. **Sub-Agent Response Protocol**:
   - Write detailed instructions to phase planning document
   - Include implementation specifics, best practices, warnings
   - Do not modify project code, only provide instructions or example code to the Main Agent

### Phase 4: Implementation ***triggered by: responding to a Complex Request*** 

1. **Main Agent Execution**:
   - Read sub-agent instructions from phase plan
   - Implement code based on guidance
   - Maintain consistency with project conventions

2. **Progress Updates**:
   - Update phase plan with completed tasks
   - Document any deviations or discoveries
   - Mark tasks as [COMPLETED], [IN PROGRESS], or [BLOCKED]

### Phase 5: Validation

1. **Review Checklist**:
   - [ ] All phase tasks completed
   - [ ] Sub-agent recommendations incorporated
   - [ ] Code tested and functional
   - [ ] Documentation updated if needed

## Directory Structure

```
/agent-team/
   .claude/
      agents/
          solidity-agent.md
          onchain-protocol-config-agent.md
          onchain-frontend-config-agent.md
          ai-webapp-config-agent.md
          documentation-agent.md
          research-agent.md
          python-data-scientist.md
          python-ai-developer.md
          business-development-agent.md
          frontend-agent.md
          web-design-specialist.md
          data-architecture-agent.md
          financial-analyst-agent.md
   planning/
      phase_1_plan.md
      phase_2_plan.md
      ...
   prompts/
      record_of_user_prompts.md
   CLAUDE.md (this file)
```

## Sub-Agent Interaction Patterns

### For Code Architecture Consultation
```
1. Main Agent � Specialist Agent: "Design pattern for [specific feature]"
2. Specialist Agent � Phase Plan: Detailed architecture + implementation steps
3. Main Agent: Implements code following instructions
```

### For Documentation Creation
```
1. Main Agent � Documentation Agent: "Create comprehensive product documentation including Product Requirement Documents (PRDs), Technical Design Documents (TDDs), Executive Summaries for non-technical stakeholders, Function Maps, or other critical product documentation.
2. Documentation Agent: Creates complete documentation
3. Main Agent: Reviews and integrates documentation
```

### For Research Tasks
```
1. Main Agent → Research Agent: "Research [topic] focusing on [aspects]"
2. Research Agent: Provides comprehensive report with sources
3. Main Agent: Uses findings to inform implementation
```

### For Data Science & Statistical Analysis
```
1. Main Agent → Python Data Scientist: "Analyze [dataset] for [pattern/hypothesis]"
2. Python Data Scientist: Provides statistical analysis, models, visualizations
3. Main Agent: Implements recommended algorithms and models
```

### For AI/LLM System Development
```
1. Main Agent → Python AI Developer: "Design [RAG/agent/fine-tuning] system for [use case]"
2. Python AI Developer: Provides architecture, frameworks, implementation patterns
3. Main Agent: Builds system following architectural guidance
```

### For Business Strategy & Analysis
```
1. Main Agent → Business Development Agent: "Evaluate [business model/market opportunity]"
2. Business Development Agent: Delivers executive analysis with recommendations
3. Main Agent: Implements technical solutions aligned with strategy
```

## Critical Rules

1. **Code Writing**: ONLY the Main Agent writes code
2. **Documentation**: Sub-agents handle all documentation creation
3. **Phase Planning**: Required for any task spanning multiple steps
4. **Telemetry**: Every user prompt must be logged with timestamp
5. **Consultation Records**: All sub-agent responses must be preserved in phase plans
6. **Iterative Refinement**: Address criticisms and triangulate solutions before implementation

## Quality Assurance Protocol

Before completing any phase:
1. Verify all sub-agent consultations are complete
2. Ensure implementation matches planning specifications
3. Confirm all user requirements are addressed
4. Update phase plan with final status
5. Log completion in telemetry

## Example Workflows

### Example 1: Blockchain Project
```
User: "Build a staking contract with frontend"
↓
Main Agent:
1. Creates /planning/phase_1_plan.md
2. Logs prompt to /prompts/record_of_user_prompts.md
3. Consults solidity-agent for contract architecture
4. Consults onchain-frontend-config-agent for dApp interface patterns
5. Implements staking contract based on instructions
6. Implements frontend with wallet connectivity
7. Updates phase plan with progress
8. Marks phase as COMPLETED
```

### Example 2: AI-Powered Analytics Platform
```
User: "Create an AI dashboard for analyzing customer churn"
↓
Main Agent:
1. Creates /planning/phase_1_plan.md
2. Consults business-development-agent for churn metrics strategy
3. Consults python-data-scientist for statistical models
4. Consults python-ai-developer for predictive AI implementation
5. Consults frontend-agent for dashboard architecture
6. Implements data pipeline and models
7. Builds interactive dashboard with insights
8. Marks phase as COMPLETED
```

---
*This orchestration system ensures consistent, traceable, and high-quality project execution through structured multi-agent collaboration.*
