#!/bin/sh

 #install os dependencies
 #apt-get update
 #apt-get install -y maven git docker docker-compose java go

 #build docker-images 
 current_path=.
 for dockerFile in `find . -type f -name 'Dockerfile'`
 do
   dockerFileHome=`cd $(dirname $dockerFile); pwd`    
   docker build . -t `echo $dockerFileHome | awk -F "onedata-studio/" '{print $NF}'`
   cd $current_path
 done
 cd $current_path

 #start 
 #docker-compose up -d 
