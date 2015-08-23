#!/bin/bash

set -euo pipefail

echo "==> Bootstrapping $1"

ssh-copy-id root@$1
$(dirname $0)/configure.sh root@$1 bootstrap
