#!/bin/bash
rsync -avz --delete --exclude 'yourkey.pem' --exclude 'deploy.sh' -e "ssh -i yourkey.pem" . ec2-user@your-public-ip:/usr/share/nginx/html