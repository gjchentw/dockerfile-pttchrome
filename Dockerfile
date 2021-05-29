FROM node:lts as npm
ENV DEFAULT_SITE="wsstelnet://bbs.pharos.rocks"
RUN git clone https://github.com/robertabcd/PttChrome.git /app && cd /app && \
    npm install && npm run prebuild && npm run build

FROM gjchen/nginx as app
COPY --from=npm /app/dist /var/lib/nginx/html
WORKDIR /var/lib/nginx/html
