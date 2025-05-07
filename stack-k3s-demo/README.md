# K3s Stack Demo

This repository contains the automation code for deploying and managing a K3s cluster on various cloud providers using Terraform. The stack is designed to be deployed through Cycloid's platform.

## Overview

This automation creates and manages a K3s cluster with the following features:
- Single-node K3s cluster deployment
- NGINX Ingress Controller installation
- Kubernetes Dashboard deployment
- Automatic kubeconfig management
- Support for multiple cloud providers (AWS, Azure, GCP, Ionos, Outscale)

## Prerequisites

- Access to a cloud provider (AWS, Azure, GCP, Ionos, or Outscale)
- SSH access to the target instance
- Cycloid platform access

## Configuration

The stack can be configured through the following parameters:

### Cloud Provider Configuration
- `cloud_type`: The cloud provider hosting the instance (AWS, Azure, GCP, Ionos, Outscale, or Other)
- `aws_ip`: AWS instance IP address (if using AWS)
- `azure_ip`: Azure instance IP address (if using Azure)
- `gcp_ip`: GCP instance IP address (if using GCP)
- `ionos_ip`: Ionos instance IP address (if using Ionos)
- `outscale_ip`: Outscale instance IP address (if using Outscale)
- `other_ip`: Instance IP address (if using other provider)

### SSH Configuration
- `ssh_key`: SSH private key to access the instance

## Deployment

The stack is designed to be deployed through Cycloid's platform. The deployment process is automated through the pipeline configuration in the `pipeline/` directory.

### Pipeline Jobs

- `deploy-k3s`: Deploys the K3s cluster and required components
- `destroy-k3s`: Destroys the K3s cluster and associated resources

## Components

### K3s
- Lightweight Kubernetes distribution
- Single binary installation
- Built-in SQLite database
- Automatic TLS certificate management

### NGINX Ingress Controller
- Deployed using Helm
- HostPort mode enabled for direct access
- Configurable through standard Kubernetes Ingress resources

### Kubernetes Dashboard
- Web-based UI for Kubernetes cluster management
- Deployed in the `kubernetes-dashboard` namespace
- Accessible through kubectl proxy

## Directory Structure

- `pipeline/`: Contains pipeline configuration for Cycloid
  - `pipeline.yml`: Main pipeline configuration
  - `variables.sample.yml`: Sample variables configuration
- `.cycloid.yml`: Cycloid project configuration

## Security

- K3s is configured with TLS enabled
- Kubernetes Dashboard is deployed with recommended security settings
- SSH access is required for initial deployment
- kubeconfig is stored securely in Cycloid credentials

## Maintenance

The stack maintenance can be performed in two ways:

1. **Code Management**: The stack is version controlled in a Git repository. You can:
   - Clone the repository
   - Make necessary modifications to the Terraform configurations
   - Submit changes through pull requests
   - Review and merge changes following your organization's Git workflow

2. **Form Customization**: The StackForms interface can be customized by:
   - Modifying the `.forms.yml` file to adjust form fields, validation rules, and UI elements
   - Adding or removing configuration options
   - Customizing the form layout and organization
   - Implementing conditional form fields based on user selections

## Support

For support, please contact your Cycloid administrator or refer to the Cycloid documentation.