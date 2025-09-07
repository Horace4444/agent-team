#!/bin/bash

# Setup MCP Servers for Agent Team Project
# This script configures all necessary MCP servers for the agent team

echo "🚀 Setting up MCP servers for Agent Team project..."
echo ""

# Check if Claude CLI is installed
if ! command -v claude &> /dev/null; then
    echo "❌ Claude CLI is not installed or not in PATH"
    echo "Please ensure Claude Code is installed and the 'claude' command is available"
    exit 1
fi

echo "✅ Claude CLI found"
echo ""

# Function to add MCP server
add_mcp_server() {
    local name=$1
    local type=$2
    shift 2
    
    echo "📦 Adding $name server..."
    
    if [ "$type" = "stdio" ]; then
        claude mcp add "$name" "$@" 2>/dev/null
    elif [ "$type" = "sse" ]; then
        claude mcp add -t sse "$name" "$@" 2>/dev/null
    fi
    
    if [ $? -eq 0 ]; then
        echo "   ✅ $name server added successfully"
    else
        echo "   ⚠️  $name server may already exist or failed to add"
    fi
    echo ""
}

# Add stdio MCP servers
echo "=== Adding Standard MCP Servers ==="
echo ""

add_mcp_server "puppeteer" "stdio" npx @modelcontextprotocol/server-puppeteer
add_mcp_server "github" "stdio" npx @modelcontextprotocol/server-github
add_mcp_server "OpenZeppelinContracts" "stdio" npx @openzeppelin/contracts-mcp
add_mcp_server "foundry" "stdio" npx @pranesh.asp/foundry-mcp-server
add_mcp_server "figma-api" "stdio" npx figma-mcp
add_mcp_server "supabase" "stdio" npx @supabase/mcp-server-supabase
add_mcp_server "vercel-ai-docs" "stdio" npx vercel-ai-docs-mcp

# Add SSE MCP servers
echo "=== Adding SSE MCP Servers ==="
echo ""

# Figma Dev Mode (requires Figma Desktop running)
add_mcp_server "figma-devmode" "sse" http://localhost:3845/mcp

# List all configured servers
echo "=== Configured MCP Servers ==="
echo ""
claude mcp list

echo ""
echo "🎉 MCP setup complete!"
echo ""
echo "📝 Notes:"
echo "   - Foundry MCP requires Foundry toolchain installed (run: curl -L https://foundry.paradigm.xyz | bash && foundryup)"
echo "   - Figma API requires API key (get from Figma.com → Settings → Security)"
echo "   - Figma Dev Mode requires Figma Desktop app running"
echo "   - Supabase MCP requires SUPABASE_ACCESS_TOKEN and project-ref configuration"
echo "   - Vercel AI Docs provides documentation access for Vercel AI SDK"
echo "   - Configure environment variables in your .env file if needed"
echo ""
echo "📚 Your agent team is now equipped with:"
echo "   ✓ Puppeteer for browser automation"
echo "   ✓ GitHub for repository management"
echo "   ✓ OpenZeppelin for smart contracts"
echo "   ✓ Foundry for Solidity development"
echo "   ✓ Figma for design integration"
echo "   ✓ Supabase for database operations"
echo "   ✓ Vercel AI Docs for deployment guidance"