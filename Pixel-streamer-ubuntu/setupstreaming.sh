#!/bin/bash
sudo apt update -y
sudo echo "ubuntu:password" | sudo chpasswd
cd /home/ubuntu/Documents/PackagedProject/LinuxNoEditor/
pwd
echo starting fps
runuser -l ubuntu -c './fps.sh -RenderOffScreen -PixelStreamingIP=127.0.0.1 -PixelStreamingPort=8888 & disown'
cd /home/ubuntu/Desktop/UnrealEngine/Samples/PixelStreaming/WebServers/SignallingWebServer/platform_scripts/bash
./setup.sh
nohup ./Start_SignallingServer.sh & disown
pwd
