#!/usr/bin/env bash
# Run this in Azure Cloud Shell after cloning the repo

git clone https://github.com/Swapnil-Sharma-9210/udacity_project_2.git
cd udacity_project_2
python3 -m venv ~/.udacity-project2
source ~/.udacity-project2/bin/activate
make all
az webapp up -n swapnil-udacity-project2 -g Azuredevops --sku FREE --runtime "PYTHON:3.8"
