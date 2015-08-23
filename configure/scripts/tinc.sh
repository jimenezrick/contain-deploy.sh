cat <<EOF
#!/bin/bash

set -euo pipefail

sudo pacman -S --noconfirm tinc

# TODO: copy files, enable start service
EOF
