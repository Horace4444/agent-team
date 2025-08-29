# Agent Team - AI-Powered Development Orchestration

## Overview

This project implements a sophisticated multi-agent development system powered by Claude, featuring specialized AI agents for different aspects of software development. Each agent has deep expertise in their domain and can leverage MCP (Model Context Protocol) servers to extend their capabilities with real-world tools and integrations.

## Project Structure

```
agent-team/
├── .claude/              # Claude configuration
│   └── agent/           # Agent definitions
├── temp/
│   └── agent-files/     # Agent configuration files
├── planning/            # Phase planning documents
├── prompts/            # User prompt history
├── CLAUDE.md           # Main orchestration guide
├── .mcp.json          # MCP server configuration
├── setup-mcp.sh       # MCP setup script
└── README.md          # This file
```

## Agent Team Roster

### Core Development Agents

#### ⛓️ **solidity-agent**
Full smart contract development lifecycle expert with architectural design, secure coding, and comprehensive testing capabilities.

#### 🔧 **onchain-protocol-config-agent**
Blockchain protocol specialist focusing on secure and gas-efficient onchain logic, Foundry setup, and deployment strategies.

#### 🌐 **onchain-frontend-config-agent**
Web3 frontend expert for modern dApp interfaces with wallet connectivity using Wagmi/OnchainKit and Viem.

#### 🤖 **ai-webapp-config-agent**
AI application specialist for Next.js 15+ with React 19, multi-provider LLM integrations, and RAG capabilities.

### Frontend & Design Agents

#### 🎨 **web-design-specialist**
Modern web design expert with Puppeteer MCP integration for real-time design assessment and React implementation guidance.

#### 📊 **frontend-agent**
20+ years React/Next.js expertise, specializing in enterprise dashboards, performance optimization, and design systems.

### Infrastructure & Analysis Agents

#### 🗄️ **data-architecture-agent**
Bleeding-edge database architect for AI-era hybrid architectures combining SQL, NoSQL, GraphQL, and vector databases.

#### 💰 **financial-analyst-agent**
Strategic financial analyst with expertise in business models, SaaS metrics, fundraising, and competitive analysis.

### Documentation & Research Agents

#### 📝 **documentation-agent**
Product documentation specialist creating PRDs, TDDs, Executive Summaries, and Function Maps.

#### 🔍 **research-agent**
Web research expert with rigorous source verification to prevent hallucinations and ensure factual accuracy.

## Quick Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/agent-team.git
cd agent-team
```

### 2. Configure MCP Servers
Run the automated setup script:
```bash
./setup-mcp.sh
```

Or manually configure servers:
```bash
# Puppeteer - Browser automation
claude mcp add puppeteer npx @modelcontextprotocol/server-puppeteer

# GitHub - Repository management
claude mcp add github npx @modelcontextprotocol/server-github

# OpenZeppelin - Smart contract templates
claude mcp add OpenZeppelinContracts npx @openzeppelin/contracts-mcp

# Foundry - Solidity development
claude mcp add foundry npx @pranesh.asp/foundry-mcp-server

# Figma API - Design integration
claude mcp add figma-api npx figma-mcp

# Figma Dev Mode - Live design sync (requires Figma Desktop)
claude mcp add -t sse figma-devmode http://localhost:3845/mcp
```

### 3. Install Prerequisites

#### Foundry (for Solidity development)
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

#### Figma Desktop (for design integration)
- Download from https://www.figma.com/downloads/
- Enable Dev Mode MCP server in settings

#### Node.js
- Version 16+ recommended for NPX-based servers

## MCP Server Integration

### Available MCP Servers

| Server | Purpose | Used By |
|--------|---------|---------|
| **Puppeteer** | Browser automation, visual testing | web-design-specialist, elite-frontend-agent |
| **GitHub** | Repository management | All development agents |
| **OpenZeppelin** | Smart contract templates | solidity-agent, onchain-protocol-config-agent |
| **Foundry** | Solidity toolchain (forge, cast, anvil) | solidity-agent, onchain-protocol-config-agent |
| **Figma** | Design-to-code conversion | web-design-specialist, elite-frontend-agent |

### Environment Variables

Configure required environment variables:

```bash
# For Foundry MCP
export RPC_URL="http://localhost:8545"
export PRIVATE_KEY="your-test-key-here"  # NEVER use mainnet keys!

# For Figma API
export FIGMA_API_KEY="your-figma-api-key"
```

## Orchestration Workflow

The system follows a structured orchestration pattern defined in `CLAUDE.md`:

1. **Request Analysis** - Main agent evaluates complexity
2. **Phase Planning** - Creates phase plans for complex tasks
3. **Sub-Agent Consultation** - Delegates to specialized agents
4. **Implementation** - Main agent implements based on guidance
5. **Validation** - Quality assurance and completion verification

## Configuration Files

### `.mcp.json`
Project-level MCP server configuration, shared via version control.

### `CLAUDE.md`
Main orchestration guide defining agent responsibilities and workflows.

### `~/.claude.json`
Local Claude configuration with personal MCP server settings.

## Security Considerations

⚠️ **IMPORTANT:**

1. **Never use mainnet private keys** with Foundry MCP
2. **Keep API keys secure** - use environment variables
3. **Use test networks** for blockchain operations
4. **Review generated code** before production deployment
5. **Maintain separate configs** for dev/prod environments

## Verifying Setup

Check all configured servers:
```bash
claude mcp list
```

All servers should show ✓ Connected status.

## Troubleshooting

### MCP Server Issues
- Ensure required software is installed
- Check environment variables
- Restart Claude Code after configuration changes

### Figma Integration
- Verify Figma Desktop is running
- Check Dev Mode server is enabled
- Ensure port 3845 is accessible

### Foundry Problems
- Run `foundryup` for latest version
- Verify `forge`, `cast`, `anvil` in PATH
- Use test keys only

## Contributing

1. Update `.mcp.json` for new MCP servers
2. Add agent configurations to `.claude/agents/`
3. Document changes in `CLAUDE.md`
4. Update `setup-mcp.sh` for new dependencies
5. Commit with descriptive messages

## Resources

- [MCP Documentation](https://modelcontextprotocol.io)
- [Claude Code MCP Guide](https://docs.anthropic.com/en/docs/claude-code/mcp)
- [Available MCP Servers](https://github.com/modelcontextprotocol/servers)
- [Foundry Book](https://book.getfoundry.sh/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts)


---

*Built with Claude Code - Orchestrating AI agents for comprehensive development workflows.*