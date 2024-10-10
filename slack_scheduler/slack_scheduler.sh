#!/bin/bash

# 1. Create the systemd user directory
mkdir -p ~/.config/systemd/user

# 2. Create the service to open Slack at 9:00 AM
cat <<EOF > ~/.config/systemd/user/slack-open.service
[Unit]
Description=Open Slack

[Service]
Type=oneshot
ExecStart=/usr/bin/flatpak run com.slack.Slack
EOF

# 3. Create the timer to trigger Slack opening at 9:00 AM on weekdays
cat <<EOF > ~/.config/systemd/user/slack-open.timer
[Unit]
Description=Timer to open Slack at 9:00 AM on weekdays

[Timer]
OnCalendar=Mon..Fri 09:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

# 4. Create the service to close Slack at 5:00 PM
cat <<EOF > ~/.config/systemd/user/slack-close.service
[Unit]
Description=Close Slack

[Service]
Type=oneshot
ExecStart=/usr/bin/pkill -f com.slack.Slack
EOF

# 5. Create the timer to trigger Slack closure at 5:00 PM on weekdays
cat <<EOF > ~/.config/systemd/user/slack-close.timer
[Unit]
Description=Timer to close Slack at 5:00 PM on weekdays

[Timer]
OnCalendar=Mon..Fri 17:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

# 6. Reload the systemd user daemon
systemctl --user daemon-reload

# 7. Enable and start the Slack open timer
systemctl --user enable --now slack-open.timer

# 8. Enable and start the Slack close timer
systemctl --user enable --now slack-close.timer

# 9. Verify that both timers are active and scheduled correctly
systemctl --user list-timers --all | grep slack
