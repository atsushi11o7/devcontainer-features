#!/usr/bin/env bash
set -e

CONFIGURE_LOCALE="${CONFIGURELOCALE:-true}"

echo "Installing base-utils..."

apt-get update

apt-get install -y --no-install-recommends \
  locales \
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
  bash-completion

if [ "$CONFIGURE_LOCALE" = "true" ]; then
  locale-gen en_US.UTF-8
  update-locale LANG=en_US.UTF-8
fi

rm -rf /var/lib/apt/lists/*

echo "base-utils installed."