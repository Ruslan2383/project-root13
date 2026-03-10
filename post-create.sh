#!/bin/bash
set -euo pipefail

echo "📦 Инициализация workspace..."

# Git-хуки через pre-commit
if [ -f .pre-commit-config.yaml ]; then
    pre-commit install
    pre-commit install --hook-type commit-msg
    echo "✅ Git hooks установлены"
fi

# Зависимости по стеку
[ -f package.json ]       && npm ci && echo "✅ Node зависимости"
[ -f requirements.txt ]   && pip install -r requirements.txt && echo "✅ Python зависимости"
[ -f go.mod ]             && go mod download && echo "✅ Go зависимости"
[ -f Cargo.toml ]         && cargo fetch && echo "✅ Rust зависимости"

# Создать .env из шаблона
if [ ! -f .env ] && [ -f .env.example ]; then
    cp .env.example .env
    echo "✅ .env создан из шаблона"
fi

echo "🚀 Workspace готов к работе!"
