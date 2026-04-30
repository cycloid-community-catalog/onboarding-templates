# Stack Deploy IDP

## Overview
This stack renders Kubernetes manifests for an application and publishes them to a dedicated manifests repository. It is designed to support Cycloid IDP onboarding scenarios where application teams deliver container images and want automated GitOps delivery (via Argo CD) into target clusters.

## Repository Layout
- `pipeline/` – Concourse pipeline definition and sample variable file.
- `templating/` – Templated Kubernetes and Argo CD manifests rendered during the pipeline run.
- `.forms.yml` – Cycloid form definition used to collect stack parameters in the UI.

## Prerequisites
- Concourse instance with the Cycloid toolkit image.
- Access to a Docker registry containing the application image.
- A Git repository that will host the rendered manifests (typically consumed by Argo CD).
- Valid Kubernetes credentials (kubeconfig) for the target cluster.
- Optional: Argo CD instance watching the manifests repository.

## Configurable Inputs
Populate `pipeline/variables.sample.yml` (or configure via Cycloid forms) with the following keys:
- **DockerHub**: `dockerhub_repository`, `dockerhub_username`, `dockerhub_password`, `app_image_tag`.
- **Manifests Git**: `manifests_git_url`, `manifests_git_branch`, `manifests_git_ssh_key`.
- **Application**: `app_replicas`.
- **Kubernetes**: `kubeconfig_content`.
- **Defaults**: `cy_api_key`, `terraform_version` (kept for consistency with other stacks).

The `.forms.yml` file mirrors these inputs to drive Cycloid’s UI when launching the stack.

## Pipeline Workflow
`pipeline/pipeline.yml` defines three jobs:
1. `generate-manifests` *(primary job)*  
   - Watches the container image and stack templates.  
   - Renders manifests by running `envsubst` on each file under `templating/`.  
   - Commits generated manifests to the configured Git repository under `${project}-${env}-${component}`.
2. `delete-app` *(utility job)*  
   - Removes the manifests directory for `${project}-${env}-${component}` from the manifests repository.  
   - Commits the deletion.

Resources:
- `app_image` – Docker image resource referenced by the deployment templates.
- `git_manifests` – Target Git repository receiving generated manifests.
- `git_stacks` – Source of this stack’s templated manifests.

## Manifest Templates
The pipeline renders the files under `templating/` using environment variables (e.g. `ORG`, `PROJECT`, `ENV`, `COMPONENT`) provided by Cycloid:
- `testenv.yml` – Namespace, Deployment, Service, and Ingress definitions. It resolves image coordinates, replica count, nip.io host, and TLS secret.
- `argocd.yml` – Argo CD `Application` resource pointing to the generated manifests directory.

You can add additional templates to this directory and they will be rendered automatically.