#!/bin/bash

# exit on error
set -e


rm -rf .build || true
mkdir -p .build/nextcloud/apps
cp index.html .build/
wget -c https://apps.nextcloud.com/api/v1/categories.json -O .build/nextcloud/apps/categories.json
wget -c https://apps.nextcloud.com/api/v1/apps.json -O .build/nextcloud/apps/apps.json
aws s3 sync .build s3://www.veloc.is/
