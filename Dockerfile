# Stage 1: build
FROM ghcr.io/getzola/zola:v0.22.1 AS zola
COPY . /site
WORKDIR /site
RUN ["zola", "build"]

# Stage 2: serve
FROM nginx:alpine
COPY --from=zola /site/public /usr/share/nginx/html
EXPOSE 80
