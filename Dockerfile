# syntax=docker/dockerfile:1

FROM node:20-alpine
WORKDIR /app
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install
COPY . .

# Ensure production dependencies are installed
RUN yarn install --production

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "src/index.js"]