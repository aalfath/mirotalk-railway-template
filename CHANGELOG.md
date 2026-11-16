# Changelog

Every merge to `main` sends an "update available" notice to everyone who deployed this template. Read the entry before you apply an update.

## 2.2.92-1 (2026-11-16)

- README: Deploy on Railway button for the published template (`mirotalk-1`). No change to the app or its configuration, so applying this update changes nothing in your deployment.

## 2.2.92 (2026-11-16)

- First release of the template: MiroTalk P2P 2.2.92, image `mirotalk/p2p:latest@sha256:8de404304cf0b092038903b1eb898520ec0f2e932793687e3a36b4e3b8a207aa`.
- Railway defaults baked into the Dockerfile: `NODE_ENV=production`, `TRUST_PROXY=true`, debug logs off, upstream's analytics script (`STATS_ENABLED`) and exit survey (`SURVEY_ENABLED`) off.
- `JWT_KEY`, `API_KEY_SECRET` and `SESSION_SECRET` are generated per deployment. `HOST` follows the Railway public domain.
