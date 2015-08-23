cat <<EOF
#!/bin/bash

set -euo pipefail

useradd -m -G users,wheel $normal_user || true

install -m 600 -D /root/.ssh/authorized_keys ~$normal_user/.ssh/authorized_keys
chown -R $normal_user:$normal_user ~$normal_user/.ssh

pacman -Syu --noconfirm
pacman -S --noconfirm sudo

%wheel ALL=(ALL) ALL
EOF
