#!/usr/bin/env bash
set -e

LOCALE="${LOCALE:-}"
TIMEZONE="${TIMEZONE:-}"

echo "Installing base-utils..."

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y --no-install-recommends \
  git \
  curl \
  wget \
  jq \
  less \
  unzip \
  tree \
  vim \
  ca-certificates \
  gnupg \
  bash-completion \
  tzdata

if [ -n "$TIMEZONE" ]; then
  ln -sf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
  echo "$TIMEZONE" > /etc/timezone
fi

if [ -n "$LOCALE" ]; then
  case "$LOCALE" in
    C.UTF-8|C|POSIX)
      ;;
    *)
      apt-get install -y --no-install-recommends locales
      locale-gen "$LOCALE"
      ;;
  esac
  printf 'LANG=%s\n' "$LOCALE" > /etc/default/locale
fi

rm -rf /var/lib/apt/lists/*

echo "base-utils installed."
