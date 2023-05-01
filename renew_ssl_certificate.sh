#!/bin/bash

# Stop Postal before renewing the certificate
postal stop

# Renew the SSL certificate with Certbot and check if renewal was successful
if certbot renew --deploy-hook "postal start"; then
  # Certificate renewal was successful, start Postal and exit
  postal start
  exit 0
else
  # Certificate renewal failed, send an email and exit
  mail -s "Certificate renewal failed" your_email@example.com < /var/log/letsencrypt/letsencrypt.log
  exit 1
fi
