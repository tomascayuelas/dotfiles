#!/bin/bash

commandToExecute="$1"
localExternalIP=`curl ifconfig.co`

if [ "$commandToExecute" == "start" ]
then

    # Instance
    gcloud compute instances start development

    # Application
    gcloud compute ssh development --command 'docker-compose -f /home/tomascayuelas/Development/Sources/Own/poupermo-api/stack/poupermo.yml start'

    # Firewalls rules
    gcloud compute firewall-rules create rabbitmq --allow tcp:10004 --sources-ranger= --network default --target-tags development

    # Show remote IP
    gcloud compute instances list --filter="name:development" --format yaml | grep natIP | awk '{print $2}'
fi

if [ "$commandToExecute" == "stop" ]
then

    # Firewalls rules
    gcloud compute firewall-rules delete rabbitmq

    # Application
    gcloud compute ssh development --command 'docker-compose -f /home/tomascayuelas/Development/Sources/Own/poupermo-api/stack/poupermo.yml stop'

    # Instance
    gcloud compute instances stop development

fi
