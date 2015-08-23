cat <<EOF
#!/bin/bash

set -euo pipefail

pacman -Syu --noconfirm
pacman -S --noconfirm ${base_pkgs[*]}
EOF
