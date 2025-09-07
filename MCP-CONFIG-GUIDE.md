# MCP Configuration Guide

## Supabase MCP Server

### Setup

1. **Get Access Token**:
   - Visit [Supabase Dashboard](https://app.supabase.com/account/tokens)
   - Create a new personal access token
   - Store securely

2. **Get Project Reference**:
   - Go to your project settings
   - Find the Reference ID (format: `abcdefghijklmnop`)
   - This scopes the MCP to a specific project

3. **Configure Environment**:
   ```bash
   export SUPABASE_ACCESS_TOKEN="your-token-here"
   export SUPABASE_PROJECT_REF="your-project-ref"  # Optional but recommended
   ```

4. **Usage Modes**:
   - **Read-Only** (Recommended):
     ```bash
     claude mcp add supabase npx @supabase/mcp-server-supabase --read-only --project-ref=YOUR_PROJECT_REF
     ```
   - **Full Access** (Use with caution):
     ```bash
     claude mcp add supabase npx @supabase/mcp-server-supabase --project-ref=YOUR_PROJECT_REF
     ```

### Available Operations

- Query tables and views
- Create and modify tables
- Deploy Edge Functions
- Manage authentication settings
- Configure storage buckets
- Access project configuration

### Agent Integration

Best used with:
- **data-architecture-agent**: For database design and optimization
- **ai-webapp-config-agent**: For building Supabase-powered applications
- **python-data-scientist**: For data analysis and reporting

## Vercel Integration

### For Deployment (Using Vercel CLI)

While we don't have a direct Vercel deployment MCP, you can use the Bash tool with Vercel CLI:

1. **Install Vercel CLI**:
   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel**:
   ```bash
   vercel login
   ```

3. **Deploy Commands**:
   ```bash
   # Deploy to preview
   vercel
   
   # Deploy to production
   vercel --prod
   
   # Link existing project
   vercel link
   ```

### Vercel AI SDK Documentation MCP

The `vercel-ai-docs` MCP provides access to Vercel AI SDK documentation:

```bash
claude mcp add vercel-ai-docs npx vercel-ai-docs-mcp
```

This gives agents access to:
- AI SDK documentation
- Best practices for LLM integration
- Streaming patterns
- Edge function examples
- Multi-provider setup guides

### Building MCP Servers with Vercel

If you want to create your own MCP server deployable on Vercel:

1. **Install Dependencies**:
   ```bash
   npm install mcp-handler @modelcontextprotocol/sdk zod@^3
   ```

2. **Create MCP Server** (Next.js example):
   ```typescript
   // app/api/mcp/route.ts
   import { createMCPHandler } from 'mcp-handler';
   
   export const { GET, POST } = createMCPHandler({
     tools: {
       // Your custom tools here
     }
   });
   ```

3. **Deploy to Vercel**:
   ```bash
   vercel
   ```

## Best Practices

### Security

1. **Never commit tokens**:
   - Use `.env.local` for local development
   - Use Vercel/Supabase environment variables for production
   
2. **Scope access appropriately**:
   - Use `--read-only` flag for Supabase when possible
   - Scope to specific projects with `--project-ref`
   
3. **Rotate tokens regularly**:
   - Set expiration dates on access tokens
   - Audit token usage in dashboards

### Agent Collaboration

When using these MCP servers with agents:

1. **Database Operations**:
   ```
   Main Agent → data-architecture-agent: "Design schema for [feature]"
   data-architecture-agent → Uses Supabase MCP to inspect current schema
   data-architecture-agent → Returns migration plan
   Main Agent → Implements migrations using Supabase MCP
   ```

2. **Deployment Workflow**:
   ```
   Main Agent → python-ai-developer: "Prepare AI app for deployment"
   python-ai-developer → Consults vercel-ai-docs MCP
   python-ai-developer → Returns deployment configuration
   Main Agent → Deploys using Vercel CLI
   ```

## Troubleshooting

### Supabase MCP Issues

- **Authentication Error**: Check `SUPABASE_ACCESS_TOKEN` is set correctly
- **Project Not Found**: Verify `SUPABASE_PROJECT_REF` matches your project
- **Permission Denied**: Ensure token has required scopes
- **Rate Limiting**: Implement retry logic with exponential backoff

### Vercel Deployment Issues

- **Build Errors**: Check `next build` locally first
- **Environment Variables**: Ensure all required vars are set in Vercel dashboard
- **Function Size**: Optimize bundle size for Edge Functions (1MB limit)

## Resources

- [Supabase MCP Documentation](https://supabase.com/docs/guides/getting-started/mcp)
- [Vercel MCP Handler](https://github.com/vercel/mcp-handler)
- [Model Context Protocol Spec](https://modelcontextprotocol.io)
- [Vercel AI SDK](https://sdk.vercel.ai)