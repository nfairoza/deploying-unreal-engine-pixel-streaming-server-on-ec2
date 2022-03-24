#!/bin/bash
sudo apt update -y
sudo echo "ubuntu:password" | sudo chpasswd
cd /home/ubuntu/Documents/PackagedProject/LinuxNoEditor/
nohup ./fps.sh -RenderOffScreen -PixelStreamingIP=127.0.0.1 -PixelStreamingPort=8888 > /dev/null 2>&1 &
cd /home/ubuntu/Desktop/UnrealEngine/Samples/PixelStreaming/WebServers/SignallingWebServer/platform_scripts/bash
./setup.sh
nohup ./Start_SignallingServer.sh & disown
pwd
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1