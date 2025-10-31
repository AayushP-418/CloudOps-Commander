FROM golang:1.22 AS dev
WORKDIR /app

# Install reflex for hot reload (works with Go 1.22)
RUN go install github.com/cespare/reflex@latest

COPY go.mod ./
RUN go mod download || true

COPY . .

EXPOSE 8080
CMD ["/go/bin/reflex", "-r", "\\.go$", "-s", "--", "sh", "-c", "go mod download && go mod tidy || true; go build -o ./bin/api ./cmd/api && ./bin/api"]