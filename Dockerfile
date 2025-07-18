FROM node:22.12-alpine AS builder

# Установка MCP
RUN npm install -g @brightdata/mcp

FROM node:22-alpine AS release

# Копируем установленный MCP из builder
COPY --from=builder /usr/local/lib/node_modules/@brightdata/mcp /app/mcp

# Устанавливаем зависимости
WORKDIR /app/mcp
RUN npm install --omit-dev

# Настройка окружения
ENV NODE_ENV=production
EXPOSE 8080

# Запуск сервера
CMD ["node", "server.js"]
