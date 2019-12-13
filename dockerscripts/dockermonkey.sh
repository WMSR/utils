#!/bin/bash
if [[ $(sudo docker ps -f status=running -f ancestor=haroldogden/vipermonkey -l | tail -n +2) ]]; then
	echo "[+] Docker container is already running!"
else
	echo "[!] Container is not running. Starting now..."
	sudo docker pull haroldogden/vipermonkey:latest
	sudo docker run --rm -d -t haroldogden/vipermonkey:latest
fi

docker_id=$(sudo docker ps -f status=running -f ancestor=haroldogden/vipermonkey -l | tail -n +2 | cut -f1 -d' ')

echo "[*] Attempting to copy file $1 into container ID $docker_id"

file_basename=$(basename $1)

echo "[*] Starting openoffice listener for file content conversions..."

sudo docker exec $docker_id sh -c '/usr/lib/libreoffice/program/soffice.bin --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore --accept="socket,host=127.0.0.1,port=2002,tcpNoDelay=1;urp;StarOffice.ComponentContext" &'

echo "[*] Checking for ViperMonkey and dependency updates..."

sudo docker exec $docker_id sh -c "cd /opt;for d in *; do cd \$d; git pull; cd /opt; done"

echo "[*] Disabling network connection for container ID $docker_id"
sudo docker network disconnect bridge $docker_id

sudo docker cp $1 $docker_id:/root/$file_basename
sudo docker exec $docker_id sh -c "/opt/ViperMonkey/vipermonkey/vmonkey.py -s --ioc /root/$file_basename"

echo "[*] Done - Killing docker container $docker_id"
sudo docker stop $docker_id > /dev/null
