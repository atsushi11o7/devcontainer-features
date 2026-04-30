#!/bin/bash
set -e

source dev-container-features-test-lib
source "$(dirname "$0")/_lib.sh"

check_packages

reportResults
