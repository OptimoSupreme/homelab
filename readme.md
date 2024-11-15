## Quadlet Notes

To run a system container through systemd, you'll need to place your .container and .pod files in `/etc/containers/systemd` and reload the daemon with `systemctl reload-daemon` after any modifications.

You can test whether podman is able to generate systemd files from your .continer and .pod files in `/etc/containers/systemd/` with `SYSTEMD_LOG_LEVEL=debug /usr/lib/systemd/system-generators/podman-system-generator --dryrun`.

Example:
```
[Unit]
Description=Dynamic DNS updater.

[Container]
Image=docker.io/favonia/cloudflare-ddns:latest
Network=host
User=1000:1000
ReadOnly=true
DropCapability=all
NoNewPrivileges=true
Environment="CLOUDFLARE_API_TOKEN=YOUR_API_TOKEN"
Environment="DOMAINS=domain.com"
AutoUpdate=registry

[Service]
Restart=always
```
Notes:
- You should use the fqdn for containers, or configure podman to allow shortened names.
- `AutoUpdate=registry` will cause the container to be automatically updated when the `podman-auto-update.timer` is enabled.
- `Restart=always` in addaition to restarting the container when a failure occurs, will start the container at system boot automatically.
- When referencing a pod or network in a .container, you must include the .network extension. For example `Pod=cloudflare-ddns.pod` and `Network=cloudflare-ddns.network`.

---