#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Setup Real Server
### ################################

chmod 0600 "${FRIGO_SERVER_KEY}"
cat << EOF | sudo tee "/usr/local/bin/frigo-server" > "/dev/null"
#!/bin/sh
ssh -i "${FRIGO_SERVER_KEY}" "ubuntu@${FRIGO_SERVER_IP}"
EOF
sudo chmod +x "/usr/local/bin/frigo-server"

chmod 0600 "${ORBS_SERVER_KEY}"
cat << EOF | sudo tee "/usr/local/bin/orbs-server" > "/dev/null"
#!/bin/sh
ssh -i "${ORBS_SERVER_KEY}" "ubuntu@${ORBS_SERVER_IP}"
EOF
sudo chmod +x "/usr/local/bin/orbs-server"

### ################################
### Setup VM Server
### ################################

cat << 'EOF' | sudo tee "/usr/local/bin/freebsd-start" > "/dev/null"
#!/usr/bin/zsh
virsh --connect "qemu:///system" start FreeBSD
EOF
sudo chmod +x "/usr/local/bin/freebsd-start"

cat << 'EOF' | sudo tee "/usr/local/bin/freebsd-close" > "/dev/null"
#!/usr/bin/zsh
virsh --connect "qemu:///system" destroy FreeBSD
EOF
sudo chmod +x "/usr/local/bin/freebsd-close"

cat << 'EOF' | sudo tee "/usr/local/bin/freebsd-restart" > "/dev/null"
#!/usr/bin/zsh
virsh --connect "qemu:///system" reboot FreeBSD
EOF
sudo chmod +x "/usr/local/bin/freebsd-restart"

cat << 'EOF' | sudo tee "/usr/local/bin/freebsd-server" > "/dev/null"
#!/usr/bin/zsh
FREEBSD_IP="$(virsh --connect "qemu:///system" domifaddr FreeBSD | awk '\$3 == "ipv4" {print \$4}' | cut -d'/' -f1)"
ssh "freebsd@\${FREEBSD_IP}"
EOF
sudo chmod +x "/usr/local/bin/freebsd-server"

### ################################################################################################################################
