# Homelab Services

## Directories
- [Home Assistant](https://github.com/OptimoSupreme/homelab/tree/main/home_assistant): Home automation [platform](https://www.home-assistant.io/).
- [Portainer](https://github.com/OptimoSupreme/homelab/tree/main/portainer): Web-based UI for managing Docker containers and services.
- [Questionable.zip](https://github.com/OptimoSupreme/homelab/tree/main/questionable.zip): Personal website.
- [Shairport-Sync](https://github.com/OptimoSupreme/homelab/tree/main/shairport-sync): Allows AirPlay streaming to Raspberry Pi.
- [Watchtower](https://github.com/OptimoSupreme/homelab/tree/main/watchtower): Monitors Docker images for updates and applies them as configured (updates all local containers by default).
- [Wirehole](https://github.com/OptimoSupreme/homelab/tree/main/wirehole): Consolidated setup for WireGuard VPN, Pi-hole ad blocking, and Unbound DNS resolver. Forked from [10h30/wirehole-ui](https://github.com/10h30/wirehole-ui).

## Additional Information
This repository contains Docker Compose configurations and associated files for various services running in my homelab. To use these compose files as is, this repo should be cloned into `/srv`. If you are planning on using Portainer, you may wish to spin that container up first, and your remaming containers from the portainer interface so that it has full control over them.

Feel free to browse, fork, or adapt for your own homelab setup.

## Contributing
Contributions are welcome! If you have any suggestions or improvements, please submit a pull request.
