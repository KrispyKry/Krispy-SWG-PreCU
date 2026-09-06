# Public source boundary

The repository has two deliberate zones.

## Public zone

The public repository is for source required to understand, build, modify, and operate the released server:

```text
README.md
LICENSE-NOTICE.md
AGPL-COMPLIANCE.md
PUBLIC-SOURCE-BOUNDARY.md
docs/                         sanitized technical documentation
scripts/                      reproducible, non-secret build/audit scripts
Core3/                        published Core3 source or a clearly linked public source repository
server-custom/                published server-side custom work used by the public release
config/*.example              non-secret configuration examples
```

## Private zone

The following must remain in a separate private workspace or private repository:

```text
client/                       retail client files and TRE archives
secrets/                      credentials, tokens, keys, certificates
ops-private/                  production runbooks and private incident records
qa-private/                   unreleased QA fixtures and test accounts
release-private/              unpublished packages and signing material
backups/                      databases, dumps, and player data
logs/                         unsanitized logs and diagnostics
```

The `.gitignore` is a safety net, not proof of compliance. Every release candidate must pass the repository audit and a human review.

## Publication rule

If a private file is required for the public server to function, it cannot be treated as private merely because it is inconvenient to publish. Review it for AGPL and copyright obligations, replace secrets with examples, and publish the required source or data before submitting the server.
