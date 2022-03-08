#!/bin/sh
cd /bedrock
echo "Running as " $(id)
echo "Removing old files"
rm -fv /bedrock/server.properties
rm -fv /bedrock/allowlist.json
rm -fv /bedrock/permissions.json
rm -rfv /bedrock/worlds
rm -rfv /bedrock/resource_packs
rm -rfv /bedrock/behavior_packs
ln -sfv /config/server.properties /bedrock/server.properties
ln -sfv /config/allowlist.json /bedrock/allowlist.json
ln -sfv /config/permissions.json /bedrock/permissions.json
ln -sfv /config/worlds /bedrock/worlds
ln -sfv /config/resource_packs /bedrock/resource_packs
ln -sfv /config/behavior_packs /bedrock/behavior_packs
LD_LIBRARY_PATH=/bedrock ./bedrock_server
