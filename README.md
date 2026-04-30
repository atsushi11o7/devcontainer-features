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
    "ghcr.io/atsushi11o7/devcontainer-features/base-utils:2": {}
  }
}
```

#### Installed packages

`git`, `curl`, `wget`, `jq`, `less`, `unzip`, `tree`, `vim`, `ca-certificates`, `gnupg`, `bash-completion`, `tzdata`

The `locales` package is installed only when a locale that requires generation (e.g. `en_US.UTF-8`, `ja_JP.UTF-8`) is requested.

#### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `locale` | string | `""` | System default locale. Empty (default) leaves the base image untouched. `C.UTF-8` is built-in (no generation). Others (`en_US.UTF-8`, `ja_JP.UTF-8`, etc.) are auto-generated. |
| `timezone` | string | `""` | Timezone (e.g. `Asia/Tokyo`). Empty (default) leaves the base image untouched. |

#### Examples

Set Japanese locale and Tokyo timezone:

```jsonc
{
  "features": {
    "ghcr.io/atsushi11o7/devcontainer-features/base-utils:2": {
      "locale": "ja_JP.UTF-8",
      "timezone": "Asia/Tokyo"
    }
  }
}
```

#### Troubleshooting locale warnings

Symptoms (running `bash`, `git`, etc. inside the container):

```
bash: warning: setlocale: LC_CTYPE: cannot change locale (en_US.UTF-8): No such file or directory
```

Cause: `LANG` (or `LC_*`) is set to a locale that has not been generated in the container — usually because the Dockerfile or base image has `ENV LANG=...` but the matching locale data is missing.

Fix: align the locale by setting `locale` on this feature to match what `LANG` expects:

```jsonc
"base-utils": { "locale": "en_US.UTF-8" }
```

Alternatively, change the `LANG` env var to `C.UTF-8` (built-in, no generation needed) in your Dockerfile.

#### Migration from v1

- `configureLocale: false` → use `locale: ""` (or omit)
- `configureLocale: true` → set `locale: "en_US.UTF-8"` explicitly (the default no longer auto-configures locale)
- The default `timezone: "Asia/Tokyo"` was removed; set it explicitly if needed
