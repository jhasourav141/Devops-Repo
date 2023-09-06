Google Kubernetes Engine (GKE) is a managed, production-ready environment for deploying containerized applications. It is based on Kubernetes, an open-source container orchestration system.

GKE provides a number of features that make it a good choice for deploying containerized applications, including:

Managed Kubernetes: GKE manages the control plane for your Kubernetes cluster, so you don’t have to. This frees you up to focus on developing and deploying your applications.
Autoscaling: GKE can automatically scale your Kubernetes cluster up or down based on demand. This helps you to optimize your costs and ensure that your applications are always running at the right capacity.
High availability: GKE automatically distributes your Kubernetes cluster across multiple zones, so your applications are always available even if one zone fails.
Security: GKE provides a number of security features, including role-based access control (RBAC), network policies, and encryption. This helps you to secure your Kubernetes cluster and protect your applications.
Prerequisite:
Before you can provision a GKE cluster using Terraform, you need to ensure that you have the following prerequisites in place:

Google Cloud Platform (GCP) Account: GCP account with the necessary permissions to create and manage resources.
Google Cloud SDK (gcloud) : which provides the command-line tools for interacting with GCP services.
Enable Google Kubernetes Engine (GKE) API: Enable the GKE API for your project. You can enable it either through the Google Cloud Console or by running the following command with the gcloud CLI.
gcloud services enable container.googleapis.com --project=PROJECT_ID
Authentication and Credentials: Configure authentication for Terraform to access your GCP account. You can use either Application Default Credentials (ADC) or a Service Account key file
Install Terraform and kubectl: Install Terraform https://terraform.io/downloads.html and kubectl https://kubernetes.io/docs/tasks/tools on your local machine.
Table of contents:
To provision a GKE cluster using Terraform, you can follow the steps below:

1: Set up a project on your Google Cloud account:

Create a new project on the Google Cloud Console or use an existing project where you want to provision the GKE cluster.

2: Enable required APIs:

Enable the Compute Engine API and Kubernetes Engine API for your project.

3: Create a Service Account:

Create a Service Account in your project with the necessary permissions to provision resources.Generate a JSON key for the Service Account.

4: Install and initialize the gcloud SDK:

Install the Google Cloud SDK on your local machine

5: Install kubectl:

Install the Kubernetes command-line tool, kubectl, on your local machine.

6: Install Terraform:

Install Terraform on your local machine

7: Create Terraform files:

Set up a directory for your Terraform files.

8: Provision the GKE cluster:

provision the GKE cluster based on your Terraform configuration.

9: Access cluster using kubectl:

Configure kubectl to connect to your GKE cluster.

10: Delete the cluster:

If you want to delete the GKE cluster,

1. Set up a project on your Google Cloud account:
To create a new project in Google Cloud using the Console, you can follow the revised steps below:

Open the Google Cloud Console in your web browser.
Navigate to the “Manage Resources” page and Create a new project. Enter project details and finally review and create the project.

2. Enable required APIs:
Enabling the APIs allows Terraform to interact with the necessary Google Cloud services and resources.

To enable the required APIs for your project, you need to select and enable two APIs: the Compute Engine Api and Kubernetes Engine Api.If you need assistance locating these APIs in the Cloud Console API Library, you can use the search field and search for each API separately.



$ gcloud services enable container.googleapis.com
$ gcloud services enable compute.googleapis.com
3. Create a Service Account:
It is recommended to use separate service accounts for different services. In this guide, we will create a dedicated service account for Terraform to ensure proper isolation and control over its permissions.

Go to the Service accounts page: serviceaccounts in the Google Cloud Console.
Click the Create service account button, Enter a name for the service account.
Select a role for the service account and Click the Create button.
The service account will be created and a JSON key file will be downloaded to your computer. This file contains the service account credentials


4. Install and initialize the gcloud SDK:
To run Terraform operations and create the GKE cluster on your GCP account, need to install and configure the Google Cloud SDK (gcloud) tool.

https://cloud.google.com/sdk/docs/install
After installing, Initialize the gcloud SDK by running the command gcloud init and following the prompts.

Authenticate with your Google Cloud account using the command gcloud auth login

commands: 

gcloud auth list
gcloud auth application-default login
gcloud config set account `ACCOUNT`
gcloud config set project `PROJECT_NAME`
5. Install kubectl:
The Kubernetes command-line tool, kubectl, is an essential tool for managing Kubernetes clusters. It enables you to interact with Kubernetes resources, deploy applications, and manage pods, services, and other components of your cluster.

https://kubernetes.io/docs/tasks/tools/
$ kubectl version
6. Install terraform:
To use Terraform you will need to install it. HashiCorp distributes Terraform as a binary package. You can also install Terraform using popular package managers.

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
$ terraform version

or you can follow this blog to get this done 
https://medium.com/cloud-native-daily/provision-gke-cluster-with-terraform-ee787457f3e