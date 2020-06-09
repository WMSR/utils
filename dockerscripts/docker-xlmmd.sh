#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
        echo "[*] User running on a Mac"
        if [ "$(docker-machine status)" == "Stopped" ]; then
                echo "[*] 'docker-machine' is Stopped. Starting it and instantiating the environment."
                docker-machine start
                docker-machine env
                eval $(docker-machine env)
        fi
fi

echo "[*] Running 'docker ps' to see if script has required privileges to run..."
docker ps

if [ $? -ne 0 ]; then
	echo "[!] 'docker ps' failed to run - you may not have the privileges to run docker. Try using sudo."
	exit
fi

if [[ $(docker ps -f status=running -f ancestor=haroldogden/xlmmd -l | tail -n +2) ]]; then
        echo "[+] Other ViperMonkey containers are running!"
fi

echo "[*] Pulling and starting container..."
docker pull haroldogden/xlmmd:latest
docker_id=$(docker run --rm -d -t haroldogden/xlmmd:latest)

echo "[*] Attempting to copy file $1 into container ID $docker_id"

file_basename=$(basename "$1")

echo "[*] Pulling the most recent version of dependencies..."

docker exec $docker_id sh -c "cd /opt;for d in *; do cd \$d; git pull > /dev/null 2>&1; cd /opt; done"

echo "[*] Installing most recently pulled XLMMacroDeobfuscator for python3..."

docker exec $docker_id sh -c "cd /opt/XLMMacroDeobfuscator/XLMMacroDeobfuscator;python3 setup.py install > /dev/null 2>&1"

echo "[*] Disabling network connection for container ID $docker_id"
docker network disconnect bridge $docker_id

docker cp "$1" "$docker_id:/root/$file_basename"

if [ $# -eq 1 ]
  then
docker exec $docker_id sh -c "python3 /opt/XLMMacroDeobfuscator/XLMMacroDeobfuscator/deobfuscator.py -f '/root/$file_basename'"
elif [ $# -eq 2 ]
  then
docker exec $docker_id sh -c "python3 /opt/XLMMacroDeobfuscator/XLMMacroDeobfuscator/deobfuscator.py -f '/root/$file_basename' --export-json /root/report.json"
docker cp "$docker_id:/root/report.json" "$2"
echo "[*] json report saved to '$2'"
else
echo "[!] Please supply at least 1 argument to analyze a file. Supply a 2nd argument for json file output. No more than 2 arguments are supported."
fi


echo "[*] Done - Killing docker container $docker_id"
docker stop $docker_id > /dev/null

