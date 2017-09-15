#!/usr/bin/env bash

commandToExecute="$1"
localExternalIP=`curl ifconfig.co`
localExternalIP="${localExternalIP}/32"

if [ "$commandToExecute" == "start" ]
then

    # Instance
    gcloud compute instances start development

    # Application
    gcloud compute ssh development --command 'docker-compose -f /home/tomascayuelas/Development/Sources/Own/poupermo-api/stack/poupermo.yml start'

    # Firewalls rules
    gcloud compute firewall-rules create rabbitmq --allow tcp:10004 --source-ranges $localExternalIP --network default --target-tags development
    gcloud compute firewall-rules create http --allow tcp:10001 --source-ranges $localExternalIP --network default --target-tags development
    gcloud compute firewall-rules create mariadb --allow tcp:10006 --source-ranges $localExternalIP --network default --target-tags development

    # Show remote IP
    gcloud compute instances list --filter="name:development" --format yaml | grep natIP | awk '{print $2}'
fi

if [ "$commandToExecute" == "stop" ]
then

    # Firewalls rules
    gcloud compute firewall-rules delete rabbitmq -q
    gcloud compute firewall-rules delete http -q
    gcloud compute firewall-rules delete mariadb -q

    # Application
    gcloud compute ssh development --command 'docker-compose -f /home/tomascayuelas/Development/Sources/Own/poupermo-api/stack/poupermo.yml stop'

    # Instance
    gcloud compute instances stop development
fi
