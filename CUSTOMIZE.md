# 🎨 Customization Examples

Here are practical examples of how to customize your AI Chat for different use cases.

## Example 1: Financial Assistant

```bash
# 1. Update .env
BRAND_NAME=FinanceAI
BRAND_TITLE=FinanceAI Assistant
BRAND_DESCRIPTION=Your AI-powered financial advisor
BRAND_COLOR=#10B981
BRAND_COLOR_SECONDARY=#059669

# 2. Add financial tools
mkdir -p tools/finance
cat > tools/finance/config.json << 'EOF'
{
  "name": "Financial Analysis",
  "tools": ["stock_lookup", "portfolio_analysis", "risk_assessment"]
}
EOF

# 3. Add finance models
cat > models.yaml << 'EOF'
endpoints:
  - name: "Finance Models"
    models:
      - gpt-4-finance
      - claude-finance
      - llama-finance
EOF
```

## Example 2: Code Assistant

```bash
# 1. Update .env
BRAND_NAME=CodeAI
BRAND_TITLE=CodeAI Developer
BRAND_DESCRIPTION=Your AI pair programmer
BRAND_COLOR=#8B5CF6
BRAND_COLOR_SECONDARY=#7C3AED

# 2. Add code tools
mkdir -p tools/code
cat > tools/code/config.json << 'EOF'
{
  "name": "Code Tools",
  "tools": ["syntax_check", "code_review", "test_generation"]
}
EOF
```

## Example 3: Customer Support

```bash
# 1. Update .env
BRAND_NAME=SupportAI
BRAND_TITLE=SupportAI Helper
BRAND_DESCRIPTION=24/7 Customer support assistant
BRAND_COLOR=#F59E0B
BRAND_COLOR_SECONDARY=#D97706

# 2. Add your knowledge base
mkdir -p data/knowledge
# Copy your FAQ, docs, etc to data/knowledge/

# 3. Mount in docker-compose.yml
volumes:
  - ./data/knowledge:/app/knowledge:ro
```

## Example 4: Education Assistant

```bash
# 1. Update .env
BRAND_NAME=EduAI
BRAND_TITLE=EduAI Tutor
BRAND_DESCRIPTION=Personalized learning assistant
BRAND_COLOR=#EC4899
BRAND_COLOR_SECONDARY=#DB2777

# 2. Add education tools
mkdir -p tools/education
cat > tools/education/config.json << 'EOF'
{
  "name": "Education Tools",
  "tools": ["quiz_generator", "lesson_planner", "progress_tracker"]
}
EOF
```

## Advanced Customizations

### Custom Welcome Message
Edit `config.yaml`:
```yaml
interface:
  customWelcome: |
    Welcome to ${BRAND_NAME}! 
    I'm here to help you with [your specialty].
    How can I assist you today?
```

### Custom Prompts
Create `prompts/custom.json`:
```json
{
  "greeting": "Hello! I'm your ${BRAND_NAME} assistant.",
  "capabilities": [
    "I can help with X",
    "I specialize in Y",
    "Ask me about Z"
  ]
}
```

### Custom Styling
Create `public/custom-theme.css`:
```css
:root {
  --brand-primary: ${BRAND_COLOR};
  --brand-secondary: ${BRAND_COLOR_SECONDARY};
}

.chat-header {
  background: linear-gradient(135deg, var(--brand-primary), var(--brand-secondary));
}
```

### Add Your Own API
Edit `docker-compose.yml`:
```yaml
services:
  chat:
    environment:
      - CUSTOM_API_URL=http://your-api:8000
      - CUSTOM_API_KEY=${YOUR_API_KEY}
```

## Quick Customization Checklist

- [ ] Update BRAND_* variables in .env
- [ ] Replace logo.svg in branding/
- [ ] Add your API keys
- [ ] Create tools in tools/
- [ ] Configure models in models.yaml
- [ ] Test with: `make test`
- [ ] Deploy with: `make prod`

## Tips

1. **Start Small**: Change branding first, then add features
2. **Test Often**: Use `make test` after each change
3. **Keep Backups**: Copy .env to .env.backup before major changes
4. **Use Volumes**: Mount your custom files instead of modifying the image
5. **Stay Updated**: Pull latest updates with `docker pull ghcr.io/hanzoai/chat:latest`

---

Need help? Check the [docs](https://docs.hanzo.ai) or create an issue!