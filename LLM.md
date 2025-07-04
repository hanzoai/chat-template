# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Hanzo AI Template - A customizable AI chat application template built on Hanzo's AI Cloud Platform. This template provides a foundation for creating domain-specific AI assistants with multi-model support, custom tools, and enterprise features.

## Quick Start

```bash
# One-command setup and launch
make dev

# This automatically:
# - Checks Docker installation
# - Copies environment templates
# - Starts all required services
# - Launches the chat interface
```

## Architecture

### Core Components

```
hanzo-ai-template/
├── chat/                # Hanzo Chat application (@hanzo/chat)
│   ├── config.yaml     # Main configuration
│   ├── models.yaml     # AI model settings
│   └── tools/          # Custom tool implementations
├── compose.yml         # Docker service orchestration
├── Makefile           # Development automation
└── templates/         # Example configurations
```

### Technology Stack
- **Chat Interface**: LibreChat fork with Hanzo customizations
- **AI Gateway**: Hanzo LLM proxy with 100+ provider support
- **Databases**: MongoDB (conversations), PostgreSQL (analytics)
- **Search**: Meilisearch for fast text search
- **Vector Store**: pgvector for semantic search
- **Storage**: MinIO (S3-compatible) for file uploads

### Service Ports
- Chat Interface: http://localhost:3081
- API Documentation: http://localhost:3081/api/docs
- MongoDB: localhost:27017
- PostgreSQL: localhost:5432
- MinIO Console: http://localhost:9001
- Meilisearch: http://localhost:7700

## Development Workflow

### Docker Operations
```bash
make up             # Start all services
make down           # Stop all services
make logs           # View service logs
make restart        # Restart services
make clean          # Clean volumes and data
```

### Customization Points

#### 1. Chat Configuration (`chat/config.yaml`)
```yaml
name: "Your AI Assistant"
description: "Specialized AI for your domain"
systemPrompt: |
  You are an AI assistant that helps with...
  
features:
  search: true
  tools: true
  multimodal: true
  streaming: true
```

#### 2. Model Configuration (`chat/models.yaml`)
```yaml
defaultModel: "gpt-4"
models:
  - id: "gpt-4"
    provider: "openai"
    maxTokens: 8192
    temperature: 0.7
```

#### 3. Custom Tools (`chat/tools/`)
Create new tools by adding files to the tools directory:
```javascript
// chat/tools/my-custom-tool/index.js
export default {
  name: 'my-custom-tool',
  description: 'Tool description',
  handler: async (params) => {
    // Implementation
  }
};
```

## Environment Configuration

### Required Variables
```bash
# AI Providers (at least one required)
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GOOGLE_AI_API_KEY=...

# Optional Services
MONGODB_URI=mongodb://localhost:27017/hanzo-chat
POSTGRES_URL=postgresql://postgres:postgres@localhost:5432/hanzo
MEILISEARCH_URL=http://localhost:7700
```

### Authentication Options
- **Clerk**: Set `CLERK_SECRET_KEY` and `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`
- **Supabase**: Set `SUPABASE_URL` and `SUPABASE_ANON_KEY`
- **None**: Leave auth variables unset for open access

## Common Patterns

### Adding a Custom Tool
1. Create tool directory: `mkdir -p chat/tools/my-tool`
2. Implement tool handler in `index.js`
3. Add configuration in `config.json`
4. Restart chat service: `make restart-chat`

### Customizing the UI
1. Mount custom CSS: `chat/public/custom.css`
2. Update branding in `chat/config.yaml`
3. Replace logo: `chat/public/logo.png`

### Connecting to External Services
1. Add service credentials to `.env.local`
2. Create integration in `chat/tools/`
3. Test with `make logs` to debug

## Deployment

### Local Testing
```bash
# Build production image
make build

# Run production mode
make prod
```

### Hanzo AI Cloud
```bash
# Install Hanzo CLI
npm install -g @hanzo/cli

# Deploy to cloud
hanzo deploy
```

### Self-Hosted
```bash
# Build and push to registry
docker build -t myregistry/my-ai-chat .
docker push myregistry/my-ai-chat

# Deploy with Docker Compose
docker compose -f compose.prod.yml up -d
```

## Template Examples

### Finance Assistant
- Document analysis tools
- Market data integration  
- Risk assessment models
- Compliance checks

### Customer Support
- Ticket integration
- Knowledge base search
- Sentiment analysis
- Auto-responses

### Developer Assistant
- Code analysis
- Documentation search
- API integration
- Debug assistance

## Troubleshooting

### Service Issues
```bash
# Check service health
make health

# View specific service logs
docker compose logs chat -f
docker compose logs mongodb -f

# Restart specific service
docker compose restart chat
```

### Common Problems

#### Port Conflicts
```bash
# Check ports in use
lsof -i :3081  # Chat
lsof -i :27017 # MongoDB
lsof -i :5432  # PostgreSQL
```

#### Database Connection
- Ensure MongoDB is running: `docker compose ps mongodb`
- Check connection string in `.env.local`
- Verify network connectivity: `docker compose exec chat ping mongodb`

#### AI Provider Errors
- Verify API keys are correct
- Check provider status pages
- Monitor rate limits in logs

## Best Practices

### Security
- Never commit `.env` files
- Use secrets management in production
- Enable authentication for public deployments
- Regular security updates

### Performance
- Enable Redis caching for responses
- Use pgvector for semantic search
- Optimize model selection for use case
- Monitor token usage and costs

### Customization
- Start with templates for common use cases
- Test tools in isolation first
- Use environment variables for configuration
- Document custom modifications

## Support

- **Documentation**: [docs.hanzo.ai](https://docs.hanzo.ai)
- **GitHub Issues**: [github.com/hanzoai/ai-template](https://github.com/hanzoai/ai-template)
- **Discord**: [discord.gg/hanzoai](https://discord.gg/hanzoai)
- **Email**: support@hanzo.ai

## Recent Updates
- Simplified to focus on Hanzo Chat as primary component
- Added template system for common use cases
- Improved Docker Compose configuration
- Enhanced customization documentation
- Streamlined deployment process