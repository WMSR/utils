#!/bin/bash
echo "[*] Running 'docker ps' to see if script has required privileges to run..."

docker ps

if [ $? -ne 0 ]; then
	echo "[!] 'docker ps' failed to run - you may not have the privileges to run docker. Try using sudo."
	exit
fi

if [[ $(docker ps -f status=running -f ancestor=haroldogden/vipermonkey -l | tail -n +2) ]]; then
        echo "[+] Docker container is already running!"
else
        echo "[!] Container is not running. Starting now..."
        docker pull haroldogden/vipermonkey:latest
        docker run --rm -d -t haroldogden/vipermonkey:latest
fi

docker_id=$(docker ps -f status=running -f ancestor=haroldogden/vipermonkey -l | tail -n +2 | cut -f1 -d' ')

echo "[*] Attempting to copy file $1 into container ID $docker_id"

file_basename=$(basename "$1")

echo "[*] Starting openoffice listener for file content conversions..."

docker exec $docker_id sh -c '/usr/lib/libreoffice/program/soffice.bin --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore --accept="socket,host=127.0.0.1,port=2002,tcpNoDelay=1;urp;StarOffice.ComponentContext" &'

echo "[*] Checking for ViperMonkey and dependency updates..."

docker exec $docker_id sh -c "cd /opt;for d in *; do cd \$d; git pull; cd /opt; done"

echo "[*] Disabling network connection for container ID $docker_id"
docker network disconnect bridge $docker_id

docker cp "$1" "$docker_id:/root/$file_basename"

if [ $# -eq 1 ]
  then
docker exec $docker_id sh -c "/opt/ViperMonkey/vipermonkey/vmonkey.py -s --ioc '/root/$file_basename'"
elif [ $# -eq 2 ]
  then
docker exec $docker_id sh -c "/opt/ViperMonkey/vipermonkey/vmonkey.py -s --ioc '/root/$file_basename' -o /root/report.json"
docker cp "$docker_id:/root/report.json" "$2"
echo "[*] json report saved to '$2'"
else
echo "[!] Please supply at least 1 argument to analyze a file. Supply a 2nd argument for json file output. No more than 2 arguments are supported."
fi

echo "[*] Done - Killing docker container $docker_id"
docker stop $docker_id > /dev/null

