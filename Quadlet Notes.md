## Quadlet Notes

To run a system container through systemd, you'll need to place your .container and .pod files in `/etc/containers/systemd` and reload the daemon with `systemctl reload-daemon` after any modifications.

Example:
```
[Container]
# You should include the image fqdn.
Image=docker.io/favonia/cloudflare-ddns:latest
# References to a pod in a .container file must include the .pod extension.
Pod=cloudflare-ddns.pod
Network=host
User=1000:1000
ReadOnly=true
DropCapability=all
NoNewPrivileges=true
Environment="CLOUDFLARE_API_TOKEN=cloudflare_token_here"
Environment="DOMAINS=your.domain.com"
AutoUpdate=registry # Configures the container to update from the registry automatically when podman-auto-update.timer is running.

[Service]
Restart=always
```

---