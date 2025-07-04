# Hanzo AI Template - Quick Start Guide

This is a simplified, easy-to-customize AI chat template based on Hanzo Chat.

## 🚀 Quick Start

```bash
# 1. Start the chat
make up

# 2. Open in browser
open http://localhost:3081

# 3. Login with demo credentials
Email: wow@this.com
Password: demo1234
```

## 📁 Simple Structure

```
ai-template/
├── docker-compose.yml   # Just 2 services: chat + mongodb
├── .env                 # Your customizations
├── branding/           # Your logos
├── tools/              # Your AI tools
└── models.yaml         # Your AI models
```

## 🎨 Easy Customization

### 1. Change Branding
Edit `.env`:
```env
BRAND_NAME=MyAI
BRAND_TITLE=MyAI Assistant
BRAND_COLOR=#FF6B6B
```

### 2. Add Your API Keys
Edit `.env`:
```env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
```

### 3. Replace Logo
Put your logo in `branding/`:
- logo.svg - Your main logo
- favicon.svg - Browser tab icon

### 4. Add Custom AI Models
Edit `models.yaml`:
```yaml
endpoints:
  - name: "My Custom Models"
    baseURL: "http://localhost:4000"
    models:
      - my-model-v1
      - my-model-v2
```

### 5. Add AI Tools
Create `tools/mytool/config.json`:
```json
{
  "name": "My Tool",
  "description": "Does something cool",
  "server": "./server.js"
}
```

## 🛠️ Simple Commands

```bash
make up      # Start
make down    # Stop
make logs    # View logs
make clean   # Reset everything
```

## 💡 Tips for Customization

1. **Keep it Simple**: This template uses just 2 containers (chat + database)
2. **Use Environment Variables**: Most customization is in `.env`
3. **Mount Your Files**: Add volumes in docker-compose.yml for your custom code
4. **Test Locally**: Everything runs on localhost for easy development

## 🔧 Common Customizations

### Add a Custom Page
1. Create your page in `public/custom-page.html`
2. Mount it in docker-compose.yml:
   ```yaml
   volumes:
     - ./public:/app/client/public/custom:ro
   ```

### Add Authentication
1. Get API keys from Clerk or Supabase
2. Add to `.env`:
   ```env
   CLERK_SECRET_KEY=sk_test_...
   NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_...
   ```

### Connect to Your LLM
1. Run your local LLM on port 4000
2. Add to `.env`:
   ```env
   LOCAL_API_URL=http://host.docker.internal:4000/v1
   ```

### Change Theme Colors
1. Edit `.env`:
   ```env
   BRAND_COLOR=#3B82F6
   BRAND_COLOR_SECONDARY=#8B5CF6
   ```

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Check what's using port 3081
lsof -i :3081

# Use a different port
# Edit docker-compose.yml: ports: "3082:3080"
```

### Can't Login
- Make sure you're using: wow@this.com / demo1234
- Check logs: `make logs`

### Theme Flickering
- Already fixed with custom CSS in `public/custom.css`
- Forces light mode to prevent dark/light flashing

## 📚 Next Steps

1. **Production Deployment**: Copy to your server, use `compose.prod.yml`
2. **Add More Tools**: Check [MCP docs](https://modelcontextprotocol.io)
3. **Customize UI**: Fork the [Hanzo Chat repo](https://github.com/hanzoai/chat)

## 🤝 Support

- Issues: Create an issue in this repo
- Docs: https://docs.hanzo.ai
- Community: https://discord.gg/hanzoai

---

Built with ❤️ by Hanzo AI - Keep it simple, make it yours!