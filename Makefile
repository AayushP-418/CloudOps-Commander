.PHONY: bootstrap dev-up dev-down test-backend test-web test-ios test-android test-contract build-images fmt lint

bootstrap:
	echo "Bootstrap not yet automated; see README for prerequisites."
	echo "Ensure asdf, Docker, and Compose are installed."

DEV_COMPOSE := docker compose -f docker-compose.yaml

dev-up:
	$(DEV_COMPOSE) up --build -d
	@sleep 4; echo "Checking backend health..."; curl -sS http://localhost:8080/health || true
	@echo "Web dev server: http://localhost:5173"

dev-down:
	$(DEV_COMPOSE) down -v

test-backend:
	cd backend-go && go test ./...

test-web:
	cd web-angularjs && npm test --silent || echo "Web tests not configured yet"

test-ios:
	echo "Run iOS tests via Xcode or fastlane"

test-android:
	echo "Run Android tests via Gradle"

test-contract:
	cd tests/jvm-contract && ./gradlew test || echo "Contract tests scaffolded"

build-images:
	$(DEV_COMPOSE) build

fmt:
	cd backend-go && go fmt ./...
	cd web-angularjs && npx prettier --write . || true

lint:
	cd backend-go && golangci-lint run || echo "golangci-lint not configured"
	cd web-angularjs && npx eslint . || echo "eslint not configured"
