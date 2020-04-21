#!/usr/bin/env bash

#todo this script is unfinished

source ~/clouddrive/lva-sample/.env

echo "Deleting the bastion"
az network bastion delete --name lvasample-bastion --g ${RESOURCE_GROUP}

echo "Deleting the resource group: ${RESOURCE_GROUP}"
az group delete --name ${RESOURCE_GROUP} --no-wait --yes
echo "It will take a few moments for the resources to be deleted."

echo "Removing the associated service principal."
az ad sp delete --id ${AAD_SERVICE_PRINCIPAL_ID}
