#!/bin/bash

# exit on error
set -e


rm -rf .build || true
mkdir -p .build/nextcloud/apps/v1
cp index.html .build/
sed -e "s%__DATE_NC_SYNC_%$(date)%g" -i .build/index.html
wget -c https://apps.nextcloud.com/api/v1/categories.json -O .build/nextcloud/apps/v1/categories.json
wget -c https://apps.nextcloud.com/api/v1/apps.json -O .build/nextcloud/apps/v1/apps.json
aws s3 sync .build s3://www.veloc.is/
