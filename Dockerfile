FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Responsive Food Restaurant"
LABEL org.opencontainers.image.description="A responsive restaurant website served by Nginx."

COPY index.html /usr/share/nginx/html/index.html
COPY ccs/ /usr/share/nginx/html/ccs/
COPY js/ /usr/share/nginx/html/js/
COPY image/ /usr/share/nginx/html/image/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
