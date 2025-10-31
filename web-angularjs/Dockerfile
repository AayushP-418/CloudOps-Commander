FROM node:18-alpine
WORKDIR /app
COPY package.json ./
RUN npm install --quiet --no-progress || true
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev"]
