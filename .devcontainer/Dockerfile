# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ARG DEBIAN_FRONTEND=noninteractive

# Системные зависимости
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    wget \
    jq \
    unzip \
    libpq-dev \
    libssl-dev \
    pkg-config \
    shellcheck \
    shfmt \
    && rm -rf /var/lib/apt/lists/*

# Глобальные инструменты форматирования
RUN npm install -g \
    prettier \
    eslint \
    stylelint \
    markdownlint-cli2 \
    @commitlint/cli \
    @commitlint/config-conventional

# Python — глобальные линтеры
RUN pip install --no-cache-dir \
    ruff \
    black \
    isort \
    mypy \
    pre-commit \
    commitizen

# Go — линтеры
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 0
