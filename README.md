# CloudOps Commander (Monorepo)

Monorepo containing backend (Go), web (AngularJS 1.8 + Webpack), mobile (iOS/Android), infra (Terraform), tests, and dev tooling.

## Prereqs
- Docker + Docker Compose
- asdf with `.tool-versions` or native runtimes (Go 1.22, Node 18, Java 21, Python 3.11)

## Quickstart (Dev)
```bash
make dev-up
# Backend health:
open http://localhost:8080/health
# Web shell:
open http://localhost:5173
```
Stop:
```bash
make dev-down
```

## Backend (Go)
- Location: `backend-go`
- Dev server inside Docker with hot reload (air)
- Health: `GET /health` returns `{ "status": "ok" }`
- Local (outside Docker):
  ```bash
  cd backend-go
  go run ./cmd/api
  ```

## Web (AngularJS 1.8)
- Location: `web-angularjs`
- Dev server: Webpack Dev Server on 5173, proxies `/api` to `:8080`
- Run locally:
  ```bash
  cd web-angularjs
  npm install
  npm run dev
  ```

## Mobile iOS
- Location: `mobile-ios`
- Open the Xcode project/workspace and run. Placeholder scaffold only.

## Mobile Android
- Location: `mobile-android`
- Open in Android Studio and run Gradle sync. Placeholder scaffold only.

## Infra / Terraform
- Locations: `infra/terraform/aws_bootstrap`, `infra/terraform/app`
- See README files in those directories. State and providers not configured by default.

## Tests
- JVM contract tests (JUnit + RestAssured): `tests/jvm-contract`
- Web E2E (JUnit + Selenium): `tests/web-e2e`
- Android unit (JUnit + MockWebServer): `tests/android-unit`
- Rego tests (OPA): `tests/rego-tests`

## Makefile targets
- `bootstrap`: verify prereqs
- `dev-up` / `dev-down`: start/stop dev stack
- `test-*`: language/project-specific tests
- `build-images`: build compose images
- `fmt`, `lint`: formatting and linting (basic)
