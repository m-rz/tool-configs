# ============================================
# Default byobu bindings
# ============================================
unbind-key -n C-a
set -g prefix ^A
set -g prefix2 F12
bind a send-prefix

# ============================================
# My custom bindings
# ============================================
bind-key -n F2 new-window -c "#{pane_current_path}" # override default new window action: don't set title to "-"
bind-key -n C-S-F2 new-session # override default new window action: don't set title to "-"
