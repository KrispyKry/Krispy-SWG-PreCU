# SWGEmu / AGPL compliance plan

Project name: **Krispy SWG — an unofficial SWGEmu Core3-based private server in development**

This document records the conditions for a future SWGEmu community-listing submission. It is not an approval or an endorsement. The project must be reviewed against the current SWGEmu requirements again immediately before submission.

## Current status

**Not yet eligible for submission.** This repository is currently a bootstrap/foundation repository. It does not yet contain the complete public Core3-based server source, a playable server, or a finalized public source repository for the server’s modifications.

## Required public source

The public source repository must contain, or clearly link to a public repository containing:

1. The legal SWGEmu Core3 source used to operate the server.
2. Every server-side modification required to build and run the public server.
3. Original server-side custom code and data required by the public release, with clear authorship and licensing notes.
4. Build, deployment, and configuration examples that do not expose secrets.
5. Upstream copyright notices, `COPYING`, and applicable AGPL notices.
6. A source offer or equivalent access path that satisfies AGPL section 13 for users interacting with the network service.

A bootstrap script that downloads Core3 is useful for development, but it is not by itself a sufficient public source repository for a listing submission.

## What must never enter the public repository

The following remain outside the public repository and outside any launcher or website download:

- Retail client `.tre` archives, `.toc` files, client executables, DLLs, or proprietary client assets.
- Leaked, stolen, or proprietary server source.
- Account databases, passwords, API tokens, SSH keys, TLS keys, private certificates, and session secrets.
- Production configuration containing IP addresses, database credentials, private endpoints, or administrative secrets.
- Backups, crash dumps, raw logs, player personal information, serial numbers, and private moderation records.
- Internal incident reports, deployment credentials, private QA notes, and unreleased operational material.

The public repository may contain sanitized examples such as `config-local.lua.example`, but never a working secret-bearing configuration.

## Custom-content rule

“Do not leak custom content” must be applied carefully:

- Original design notes, unreleased prototypes, private QA fixtures, operational tooling, and unreleased assets may remain private.
- Any server-side custom code or data required by the public Core3 server must be published when required by the applicable AGPL obligations and SWGEmu listing rules.
- Private content must not be loaded by the public release until its publication and licensing position has been reviewed.
- Client-side proprietary material is never a substitute for public server source and must not be distributed by this project.

This separation protects private development material without attempting to withhold source that must be made available for a networked AGPL server.

## Listing package checklist

Before submitting, complete every item:

- [ ] Full Core3-based public source repository is reachable without a private login.
- [ ] All required server-side modifications are present in the public source location.
- [ ] AGPL notices, `COPYING`, attribution, and source-offer language are present and reviewed.
- [ ] Public-tree audit passes with no client files, secrets, credentials, backups, or private configuration.
- [ ] Clean Debian build succeeds from the published source.
- [ ] Database initialization, local login, zoning, character persistence, logout, reconnection, and recovery are verified.
- [ ] Server status is truthfully labeled `Pre-release` or `Live`.
- [ ] Server name, public repository URL, Core3 type, and owner contact are ready.
- [ ] Site language says “unofficial private server based on SWGEmu Core3,” not “official SWGEmu server.”
- [ ] No account, item, or credit selling is advertised.
- [ ] Submission is made through the current SWGEmu community server-submission process.

## Release gate

Do not submit while any item above is unchecked. Do not publish a launcher or client package until the distribution method has been separately reviewed for client-data and copyright boundaries.
