# Look outside

This is a small script that can be ran as a daemon that will display
notifications to remind the user that they need to look away from the screen for
20s every 20min in order to help managing eye strain and slowing down myopia progression.

This is also known as the 20-20-20 rule and is often recommended by optometrists.

**Disclaimer**: This script was created for personal use, I'm not a doctor, and
this should not be considered medical advice. Please follow your doctor's
recommendations.

## Requirements

- GNU/Linux or macOS
- On GNU/Linux: have `libnotify` installed and set up
- On macOS: have notification enabled for Script Editor


## Recommendations

Create a service to run the daemon on GNU/Linux, on macOS you can use `launchd` to run it on startup.

### Example systemd service

Create a new file `/home/<user>/.config/systemd/look-outside.service` with the following content:
```
[Unit]
Description=Reminder to look outside every 20min

[Service]
ExecStart=<PATH TO look-outside.sh>
Restart=always

[Install]
WantedBy=default.target
```

Do not forget to set `ExecStart` to the path to the script location.

Enable it with the following command:
```sh
systemctl --enable --user --now look-outside.service
```
