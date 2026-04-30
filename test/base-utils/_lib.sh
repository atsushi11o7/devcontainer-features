#!/bin/bash
# Shared check helpers. Sourced by per-scenario test scripts.

check_packages() {
  check "git is installed" git --version
  check "curl is installed" curl --version
  check "wget is installed" wget --version
  check "jq is installed" jq --version
  check "less is installed" less --version
  check "unzip is installed" unzip -v
  check "tree is installed" tree --version
  check "vim is installed" vim --version
  check "gnupg is installed" gpg --version
  check "bash-completion is installed" bash -c '[ -f /usr/share/bash-completion/bash_completion ]'
}

check_locale() {
  local expected="$1"
  check "default locale is $expected" bash -c "grep -q '^LANG=${expected}\$' /etc/default/locale"
}

check_timezone() {
  local expected="$1"
  check "timezone is $expected" bash -c "grep -q '^${expected}\$' /etc/timezone"
}
