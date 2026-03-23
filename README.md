# Building a CI/CD Pipeline

[![Python application](https://github.com/Swapnil-Sharma-9210/udacity_project_2/actions/workflows/python-app.yml/badge.svg)](https://github.com/Swapnil-Sharma-9210/udacity_project_2/actions/workflows/python-app.yml)

## Overview

This project builds a CI/CD pipeline for a Python Flask Machine Learning application that predicts Boston housing prices using a pre-trained sklearn GradientBoosting model.

- **Continuous Integration** — GitHub Actions (install, lint, test on every push)
- **Continuous Delivery** — Azure Pipelines to Azure App Service

## Project Plan

* [Trello Board](https://trello.com/your-board-link)
* [Project Spreadsheet](Azure-Devops-CICD-project-plan.xlsx)

## Architecture

![CI diagram](./screenshots/ci-diagrams.png)
![CD diagram](./screenshots/cd-diagrams.png)

## Instructions

### 1. Configure GitHub SSH and Clone

In Azure Cloud Shell:

```bash
ssh-keygen -t rsa -b 2048 -C "your@email.com"
cat ~/.ssh/id_rsa.pub
```

Copy the key to GitHub → Settings → SSH and GPG keys, then clone:

```bash
git clone git@github.com:Swapnil-Sharma-9210/udacity_project_2.git
cd udacity_project_2
```

![Clone project](./screenshots/clone_project.png)

### 2. Create Virtual Environment

```bash
make setup
source ~/.udacity-project2/bin/activate
```

![Virtual env active](./screenshots/active_virtualenv.png)

### 3. Install, Lint, and Test

```bash
make all
```

![make all output](./screenshots/make_all.png)

### 4. Run App Locally and Test Prediction

```bash
export FLASK_APP=app.py
flask run
```

In a second terminal:

```bash
sh make_prediction.sh
```

![Local prediction](./screenshots/make_test_local.png)

### 5. Deploy to Azure App Service

```bash
az webapp up -n swapnil-udacity-project2 -g Azuredevops --sku FREE --runtime "PYTHON:3.8"
```

![Deploy to Azure](./screenshots/deploy_code_to_azappservice.png)

![App home page](./screenshots/azure_app_home.png)

### 6. Test Prediction on Azure

```bash
sh make_predict_azure_app.sh
```

![Azure prediction](./screenshots/make_test_azure.png)

### 7. Stream Logs

```bash
az webapp log tail --name swapnil-udacity-project2 --resource-group Azuredevops
```

![Log tail](./screenshots/appservice_tail_log.png)

### 8. GitHub Actions (CI)

Push any change to trigger the CI pipeline. Go to your repo Actions tab to verify all steps pass.

![GitHub Actions](./screenshots/github_action_output.png)

### 9. Azure Pipelines (CD)

Setup Azure Pipelines to deploy the application automatically on every push to main.

![Azure Pipeline](./screenshots/Azure_pipeline_success.png)

### 10. Load Testing with Locust

```bash
pip install locust
locust
```

Open http://localhost:8089, set host to `https://swapnil-udacity-project2.azurewebsites.net`, set users and spawn rate, then click Start.

![Locust config](./screenshots/locust_config_test.png)
![Locust results](./screenshots/locust_load_test.png)

## Enhancements

The pipeline can be extended with GitFlow so commits to different branches trigger deployments to different environments (dev, staging, production).

## Demo Video

[YouTube Demo](https://youtu.be/your-video-link)
