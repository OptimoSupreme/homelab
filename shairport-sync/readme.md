Set hostname:
```
sudo hostnamectl set-hostname shairport-sync
```

Update the system and install alsa-utils and shairport-sync:
```
sudo dnf update && sudo dnf install alsa-utils shairport-sync -y
```

For a multi-instance setup, copy the default config to for each instance:
```
sudo cp /etc/shairport-sync.conf /etc/shairport-sync/outdoor_speakers.conf
sudo cp /etc/shairport-sync.conf /etc/shairport-sync/dining_room.conf
```

Create the two new systemd service files pointing to each config:

/etc/systemd/system/shairport-sync-dining.service
```
[Unit]
Description=Shairport Sync AirPlay Receiver - Dining Room
After=network.target

[Service]
ExecStart=/usr/bin/shairport-sync -c /etc/shairport-sync/dining_room.conf
Restart=always
User=shairport-sync
Group=audio

[Install]
WantedBy=multi-user.target
```
/etc/systemd/system/shairport-sync-outdoor.service
```
[Unit]
Description=Shairport Sync AirPlay Receiver - Outdoor Speakers
After=network.target

[Service]
ExecStart=/usr/bin/shairport-sync -c /etc/shairport-sync/outdoor_speakers.conf
Restart=always
User=shairport-sync
Group=audio

[Install]
WantedBy=multi-user.target
```

Allow shairport-sync through firewall:
```
sudo firewall-cmd --permanent --add-port=319-320/udp
sudo firewall-cmd --permanent --add-port=3689/tcp
sudo firewall-cmd --permanent --add-port=5353/tcp
sudo firewall-cmd --permanent --add-port=5353/udp
sudo firewall-cmd --permanent --add-port=5000/tcp
sudo firewall-cmd --permanent --add-port=7000-7001/tcp
sudo firewall-cmd --permanent --add-port=6000-6009/udp
sudo firewall-cmd --permanent --add-port=32768-60999/udp
sudo firewall-cmd --permanent --add-port=32768-60999/tcp
sudo firewall-cmd --reload
```

Adjust the volume levels for your sound cards with `sudo alsamixer` and save them with `sudo alsactl store`.

Gather your sound card and device number with `sudo aplay -l`.

Edit the config files for each instance. Set the name, if it is a multi instance setup increment the device_is by 1, and set the output device.

---
This is outside the scope of a normal configuration.

My USB sound cards were not compatible with the sample rate of Airplay, so I resampled them with Alsa, and configured shairport-sync to output to the resampled outputs. This allows shairport-sync to output a sample rate it supports, and for teh sound card to receive a sample rate they support.

Create the file `/etc/asound.conf`
```
# Resample for the first USB DAC (card 2)
pcm.usb_dac1 {
    type hw
    card 2
    device 0
}

pcm.resampled_dac1 {
    type plug
    slave {
	pcm "usb_dac1"
        rate 48000	 # Force resampling to 48,000 fps
    }
}

# Resample for the second USB DAC (card 3)
pcm.usb_dac2 {
    type hw
    card 3
    device 0
}

pcm.resampled_dac2 {
    type plug
    slave {
	pcm "usb_dac2"
        rate 48000	 # Force resampling to 48,000 fps
    }
}
```