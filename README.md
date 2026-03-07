# Dev Container Features

This repository contains Dev Container Features.

## Features

### `base-utils`

Common CLI utilities for devcontainers.

#### Usage

Add the following to your `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/atsushi11o7/devcontainer-features/base-utils:1": {}
  }
}
```

#### Installed packages

`locales`, `git`, `curl`, `wget`, `jq`, `less`, `unzip`, `tree`, `vim`, `ca-certificates`, `gnupg`, `bash-completion`, `tzdata`

#### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `configureLocale` | boolean | `true` | Configure `en_US.UTF-8` locale |
| `timezone` | string | `Asia/Tokyo` | Set the timezone |
