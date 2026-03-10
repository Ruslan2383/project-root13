#!/bin/bash
set -euo pipefail

echo "🔄 Проверка сервисов..."

# Ожидание PostgreSQL
until pg_isready -h db -U devuser -d devdb 2>/dev/null; do
    echo "⏳ Ожидание PostgreSQL..."
    sleep 2
done
echo "✅ PostgreSQL доступен"

# Ожидание Redis
until redis-cli -h redis ping 2>/dev/null | grep -q PONG; do
    echo "⏳ Ожидание Redis..."
    sleep 2
done
echo "✅ Redis доступен"
