# postal-cert-renewal
A simple script that can be run via a cron which renews SSL certificates for use with Postal server.

## Getting started
First we need to create a directory to hold the script which can be downloaded from github. Use the command below:
```sudo mkdir -p /opt/postal/scripts && cd /opt/postal/scripts/ && git clone https://github.com/stevennoad/postal-cert-renewal.git```

### Initial certbot setup command
```sudo certbot certonly --standalone --preferred-challenges http -d yourdomain.example.com --config-dir /opt/postal/config/```

### Cron setup
Setup a cron to run the script every 85 days. The script will take care of renewing the certificate and stopping/starting postal to ensure the new certificate is copied to postal container.

```sudo crontab -e```
```MAILTO=your_email@example.com```
```0 2 */85 * * /opt/postal/scripts/renew_cert.sh >> /var/log/renew_cert.log 2>&1```

#### Log
For issues with the cron, errors are written to a log file located
```/var/log/renew_cert.log```