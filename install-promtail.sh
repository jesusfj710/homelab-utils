mkdir -p /etc/apt/keyrings/
apt install gpg -y
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor > /etc/apt/keyrings/grafana.gpg
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee /etc/apt/sources.list.d/grafana.list
apt update
apt install promtail -y
apt install systemd-journal-remote -y
systemctl enable systemd-journal-gatewayd
systemctl start systemd-journal-gatewayd
usermod -aG systemd-journal promtail
