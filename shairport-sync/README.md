# Additional Changes Needed

## Forward the following ports
sudo ufw allow 319:320/udp
sudo ufw allow 3689/tcp
sudo ufw allow 5353
sudo ufw allow 5000/tcp
sudo ufw allow 7000/tcp
sudo ufw allow 6000:6009/udp
sudo ufw allow 32768:60999/udp
sudo ufw allow 32768:60999/tcp

## Adjust Host Volume
Install `alsautils` and use `sudo alsamixer` to set the volume level of a given audio interface. Make the change permanent by running `sudo alsactl store`.