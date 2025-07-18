FROM node:18-alpine

# Устанавливаем MCP глобально
RUN npm install -g @brightdata/mcp

# Создаем рабочую директорию
WORKDIR /app

# Настройка окружения
ENV NODE_ENV=production
EXPOSE 8080

# Запускаем MCP сервер
CMD ["mcp"]
