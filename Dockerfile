# MiroTalk P2P, official image from Docker Hub (mirotalk/p2p).
# Upstream publishes only the `latest` tag, so this template pins the exact
# image by digest. App version in this image: 2.2.92 (package.json).
FROM mirotalk/p2p:latest@sha256:8de404304cf0b092038903b1eb898520ec0f2e932793687e3a36b4e3b8a207aa

# Railway defaults. The image ships upstream's .env.template as /src/.env;
# dotenv never overrides variables that are already set, so these ENV lines
# (and any Railway service variable) take precedence over that file.
ENV NODE_ENV=production \
    TRUST_PROXY=true \
    LOGS_DEBUG=false \
    LOGS_COLORS=false \
    STATS_ENABLED=false \
    SURVEY_ENABLED=false

# Railway injects PORT; the app listens on it (default 3000).
EXPOSE 3000

CMD ["node", "app/src/server.js"]
