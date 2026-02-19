#!/bin/bash

# ==========================================
# Used colors - change here
# ==========================================
BG="1e1e2e"
INNER="3b4252"
ACTIVE="1793d1"
HOVER="4c556a"
TEXT="ffffff"

# ==========================================
# Automatic file generation (for waybar)
# ==========================================
cat <<EOF >~/.config/waybar/colors.css
@define-color background #${BG};
@define-color inner      #${INNER};
@define-color active     #${ACTIVE};
@define-color text_color #${TEXT};
@define-color hover      #${HOVER};
EOF

# ==========================================
# Automatic file generation (for hyprland)
# ==========================================
cat <<EOF >~/.config/hypr/colors.conf
\$background = rgb(${BG})
\$inner = rgb(${INNER})
\$active = rgb(${ACTIVE})
\$text_color = rgb(${TEXT})
\$hover = rgb(${HOVER})
EOF

echo "Color theme updated"

# ==========================================
# Restart waybar
# ==========================================
killall waybar
hyprctl dispatch exec waybar
