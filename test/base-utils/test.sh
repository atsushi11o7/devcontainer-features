#!/bin/bash
set -e

source dev-container-features-test-lib

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
check "locale is configured" bash -c 'locale | grep -q "LANG=en_US.UTF-8"'

reportResults
