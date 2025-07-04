# Simple Makefile for Custom Branded Chat
BRAND_NAME ?= $(shell grep BRAND_NAME .env | cut -d '=' -f2)

.PHONY: help
help: ## Show this help
	@echo "$(BRAND_NAME) Chat - Custom Deployment"
	@echo "===================================="
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: setup-env
setup-env: ## Create .env from .env.example if missing
	@if [ ! -f .env ]; then \
		cp .env.example .env && \
		echo "📝 Created .env from template"; \
	fi

.PHONY: up
up: setup-env ## Start services
	docker compose up -d
	@echo "✅ $(BRAND_NAME) Chat running at http://localhost:3081"

.PHONY: down
down: ## Stop services
	docker compose down

.PHONY: logs
logs: ## View logs
	docker compose logs -f

.PHONY: test
test: ## Test custom tools and branding
	@echo "Testing $(BRAND_NAME) branding..."
	@./test.sh

.PHONY: clean
clean: ## Clean data (preserves config)
	docker compose down -v
	rm -rf data/

# Production commands
.PHONY: prod
prod: ## Start production services
	docker compose -f docker-compose.yml -f compose.prod.yml up -d

.PHONY: prod-down
prod-down: ## Stop production services
	docker compose -f docker-compose.yml -f compose.prod.yml down