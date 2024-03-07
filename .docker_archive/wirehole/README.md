# All-in-One DNS, VPN, and Pihole server Docker Compose solution.

## Overview
This GitHub repository provides a comprehensive, all-in-one network solution using Docker Compose. It integrates **Unbound**, **Pi-hole**, and **Wireguard** (wg-easy is Wireguard with a webpage gui) containers to offer a robust combination of DNS resolution, ad-blocking, and VPN capabilities. This setup is ideal for creating a private, secure, and efficient networking environment.

### Installing on Ubuntu or Fedora
Modern releases of Ubuntu (17.10+) and Fedora (33+) include `systemd-resolved` which is configured by default to implement a caching DNS stub resolver. This will prevent pi-hole from listening on port 53. The stub resolver should be disabled with:
```
sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
```
This will not change the nameserver settings, which point to the stub resolver thus preventing DNS resolution. Change the `/etc/resolv.conf` symlink to point to `/run/systemd/resolve/resolv.conf`, which is automatically updated to follow the system's netplan:
```
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
sudo systemctl restart systemd-resolved
```

## Additional Notes
- Be sure to change the noted (look for the `⚠️`) configuration lines.
- Regularly update your Docker images for security patches, this repo contains my watchtower compose file which will handle these updates for you.
- I highly recommend the blocklists offered by [oisd](https://oisd.nl/setup) for pihole.
