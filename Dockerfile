# -------- Stage 1: Node 18 Alpine --------
FROM node:18-alpine AS builder

WORKDIR /app
COPY . .

# -------- Stage 2: Nginx --------
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
