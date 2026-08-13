# Krispy SWG Pre-CU

Development workspace for a customized Star Wars Galaxies pre-Combat Upgrade server based on the official [SWGEmu Core3](https://github.com/swgemu/Core3) project.

## Source baseline

- Upstream: `swgemu/Core3`
- Branch: `unstable` (the current upstream default)
- License: GNU Affero General Public License v3 or later
- Target host: Debian 12

Run the bootstrap script to download the current official server source:

```bash
./scripts/fetch-core3.sh
```

The checkout is placed in `Core3/`, with its `origin` remote renamed to `upstream`. This keeps the official SWGEmu history separate from this project repository and makes future synchronization explicit.

## Important client-file boundary

Core3 does not include the proprietary retail client data. You must provide the required `.tre` files from a legally obtained Star Wars Galaxies installation. Do not commit `.tre`, client executables, account databases, credentials, keys, or local server configuration to this repository.

## Next steps after fetching

Core3 currently supports Docker, WSL2, and automated Linux setup. For the planned Debian 12 VM, start with:

```bash
cd Core3/linux
less README.md
```

For a Docker-based development environment, use the instructions in `Core3/README.md` and `Core3/docker/`.

## Licensing

Core3 and its engine are AGPL-3.0-or-later. Preserve upstream copyright and license notices. If a modified version is made available to users over a network, AGPL section 13 requires offering those users the corresponding source code. See `LICENSE-NOTICE.md` and the upstream `Core3/COPYING` file after bootstrap.

This project is unaffiliated with Lucasfilm, Disney, Sony Online Entertainment, Daybreak Game Company, or the SWGEmu team. Star Wars and related marks belong to their respective owners.
