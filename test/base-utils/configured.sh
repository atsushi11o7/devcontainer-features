#!/bin/bash
set -e

source dev-container-features-test-lib
source "$(dirname "$0")/_lib.sh"

check_packages
check_locale "ja_JP.UTF-8"
check_timezone "Asia/Tokyo"

reportResults
