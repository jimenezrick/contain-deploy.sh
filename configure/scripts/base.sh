cat <<EOF
#!/bin/bash

set -euo pipefail

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm ${base_pkgs[*]}
EOF
