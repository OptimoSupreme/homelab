# All-in-One DNS, VPN, and Pihole server Docker Compose solution.

## Overview
This GitHub repository provides a comprehensive, all-in-one network solution using Docker Compose. It integrates **Unbound**, **Pi-hole**, and **Wireguard** (wg-easy is Wireguard with a webpage gui) containers to offer a robust combination of DNS resolution, ad-blocking, and VPN capabilities. This setup is ideal for creating a private, secure, and efficient networking environment.

### Configuring the firewall
The easiest way to get around port 53 being in use already, *and* leave your system as close to baseline as possible, is to just use firewalld to forward 53 to another free port.

```
sudo firewall-cmd --add-forward-port=port=53:proto=udp:toport=5354 --permanent
sudo firewall-cmd --add-forward-port=port=53:proto=tcp:toport=5354 --permanent
sudo firewall-cmd --reload
```
**The following ports will need to be opened for Wireholes services.**
TCP Ports: 53, 8080, 51821
UDP Ports: 53, 51820

### Additional Notes
- Be sure to change the values in the `.env` files.
- I recommend the blocklists offered by [oisd](https://oisd.nl/setup) for pihole.
