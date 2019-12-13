#!/bin/bash
if [[ $(sudo docker ps -f status=running -f ancestor=vipermonkey -l | tail -n +2) ]]; then
	echo "[+] Docker container is already running!"
else
	echo "[!] Container is not running. Starting now..."
	sudo docker run --rm -d -t haroldogden/vipermonkey:latest
fi

docker_id=$(sudo docker ps -f status=running -f ancestor=vipermonkey -l | tail -n +2 | cut -f1 -d' ')

echo "[*] Attempting to copy file $1 into docker ID $docker_id"

file_basename=$(basename $1)

echo "[*] Checking for ViperMonkey updates..."

sudo docker exec $docker_id sh -c "cd /opt;for d in *; do cd \$d; git pull; cd /opt; done"

sudo docker cp $1 $docker_id:/root/$file_basename
sudo docker exec $docker_id sh -c "/opt/ViperMonkey/vipermonkey/vmonkey.py -s --ioc /root/$file_basename"

