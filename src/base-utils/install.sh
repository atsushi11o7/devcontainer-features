#!/usr/bin/env bash
set -e

CONFIGURE_LOCALE="${CONFIGURELOCALE:-true}"
TIMEZONE="${TIMEZONE:-Asia/Tokyo}"

echo "Installing base-utils..."

export DEBIAN_FRONTEND=noninteractive

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
  bash-completion \
  tzdata

ln -sf /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
echo "$TIMEZONE" > /etc/timezone

if [ "$CONFIGURE_LOCALE" = "true" ]; then
  locale-gen en_US.UTF-8
  update-locale LANG=en_US.UTF-8
fi

rm -rf /var/lib/apt/lists/*

echo "base-utils installed."