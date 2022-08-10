## Install Regolith

Register the Regolith public key to your local apt:

```
wget -qO - https://regolith-desktop.org/regolith.key | \
	gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
```

Add the repository URL to your local apt:
```
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
	https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
	sudo tee /etc/apt/sources.list.d/regolith.list

Update apt and install Regolith

```
$ sudo apt update
$ sudo apt install regolith-desktop
$ sudo apt upgrade
```
