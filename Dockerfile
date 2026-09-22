FROM node:20-alpine AS build
WORKDIR /app
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json 
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine AS production
WORKDIR /app
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json 
COPY --from=build /app/dist/ng-app ./dist/ng-app
EXPOSE 4000
CMD ["node", "dist/ng-app/server/server.mjs"]
