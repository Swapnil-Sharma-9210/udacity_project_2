#!/bin/bash
APP_NAME="swapnil-ml-app"
RESOURCE_GROUP="swapnil-group"

az group create --name $RESOURCE_GROUP --location eastus

az webapp up \
  --name $APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --runtime "PYTHON|3.10"

echo "App deployed at: https://$APP_NAME.azurewebsites.net"
