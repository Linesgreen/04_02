FROM node:18-alpine

WORKDIR /app

# Установка pnpm нужной версии
RUN npm install -g corepack@0.24.1 && corepack enable && corepack prepare pnpm@9.1.4 --activate

COPY package.json pnpm-lock.yaml ./

# Установка зависимостей
RUN pnpm install --force

COPY . .

# Сборка приложения
RUN pnpm run build

EXPOSE 5001

CMD ["pnpm", "run", "start:prod"]
