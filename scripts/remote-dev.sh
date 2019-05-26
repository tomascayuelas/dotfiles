#!/bin/env bash

projectName="tomascayuelas.es:api-project-291345019278"
zoneName="europe-west4-a"
instanceName="instance-2"

function connect() {

  gcloud compute --project $projectName ssh --zone $zoneName $instanceName

}

connect

