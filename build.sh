#!/bin/sh

 #install os dependencies
 #apt-get update
 #apt-get install -y maven git docker docker-compose java go

 #build docker-images 
 current_path=.
 for dockerFile in `find . -type f -name 'Dockerfile'`
 do
   echo -e "\nRun docker build $dockerFileHome \n"
   dockerFileHome=`cd $(dirname $dockerFile); pwd`    
   docker build --force-rm $dockerFileHome -t `echo $dockerFileHome | awk -F "onedata-studio/" '{print $NF}'`
   cd $current_path
 done
 echo -e "\nDocker rmi with filter: dangling=true\n"
 docker rmi -f $(docker images --filter dangling=true -q)

 cd $current_path

 #start 
 docker-compose up -d 
