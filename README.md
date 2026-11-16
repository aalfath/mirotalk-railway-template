[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/mirotalk-1?utm_medium=integration&utm_source=button&utm_campaign=mirotalk)

# MiroTalk on Railway

One-click Railway template for [MiroTalk P2P](https://github.com/miroslavpejic85/mirotalk), a self-hosted, browser-based WebRTC video calling app (AGPL-3.0). Rooms, screen sharing, chat, whiteboard, file sharing and in-browser recording, with no accounts and no client install.

## What it deploys

- One service, **MiroTalk**, built from this repo's `Dockerfile`, which pins the official image `mirotalk/p2p` by digest (app version **2.2.92**). Upstream publishes only the `latest` tag, so the digest is the pin.
- A public Railway domain. Health check: `/`.
- No database and no volume: MiroTalk P2P keeps rooms in memory and sends audio and video peer to peer (or through a TURN relay). Nothing on the server needs to survive a redeploy; recordings are saved in the participant's browser.

## Variables

| Variable | Default | Notes |
|---|---|---|
| `PORT` | `3000` | Port the app listens on |
| `HOST` | `https://${{RAILWAY_PUBLIC_DOMAIN}}` | Public URL of the app, used in invite links and API answers |
| `JWT_KEY` | generated (64 hex chars) | Signs room and host tokens. The app refuses to start without it |
| `API_KEY_SECRET` | generated | Key for the REST API (`/api/v1/...`) |
| `SESSION_SECRET` | generated | Session cookie secret (used with OIDC login) |

Fixed defaults live in the `Dockerfile` (`NODE_ENV=production`, `TRUST_PROXY=true`, analytics and exit survey off). Every other setting from upstream's [`.env.template`](https://github.com/miroslavpejic85/mirotalk/blob/master/.env.template) can be added as a Railway variable on the service, for example:

- `HOST_PROTECTED=true` plus `HOST_USERS` (`username:password` pairs separated by `|`) to require a login before anyone can start a room.
- `TURN_SERVER_URL`, `TURN_SERVER_USERNAME`, `TURN_SERVER_CREDENTIAL` for your own TURN relay. The image's defaults point to a shared public relay; calls between strict NATs or corporate networks need a reliable TURN server.
- `OIDC_ENABLED=true` and the `OIDC_*` values for single sign-on.

## Updates

This template builds from this repo. When `main` changes (a new pinned image, a new default), Railway shows everyone who deployed the template an "update available" notice, and they choose when to apply it. Each change is listed in [`CHANGELOG.md`](CHANGELOG.md).
