# Kubernetes Cluster Deployment with Terraform

This repository provides the necessary configuration files and instructions to create a Kubernetes cluster using Terraform and deploy an Nginx server on the cluster.

## Prerequisites

Before you begin, ensure that you have the following prerequisites installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html): Make sure you have Terraform installed and properly configured on your system. Follow the installation instructions for your operating system.

- [AWS CLI](https://aws.amazon.com/cli/): Install the AWS Command Line Interface (CLI) on your local machine. You can find installation instructions on the AWS CLI documentation page.

- [kubectl](https://kubernetes.io/docs/tasks/tools/): Install and configure `kubectl`, the official command-line tool for interacting with Kubernetes clusters, on your local machine. Refer to the Kubernetes documentation for installation instructions.

## Deployment

1. Clone or download this repository to your local machine.
2. Navigate to the repository directory.

3. Initialize Terraform by running `terraform init`.

4. Modify the variables in the Terraform configuration files to match your desired settings.

5. Deploy the Kubernetes cluster by running `terraform apply`.

6. Configure your local `kubectl` to connect to the newly created cluster:

> Note: If you are using Linux or macOS, you can copy the kubeconfig file to the default location by running the following command:
>
> ```
> cp kubeconfig ~/.kube/config
> ```

7. Verify that your `kubectl` is connected to the cluster by running `kubectl get nodes`.

8. Deploy the Nginx server on the Kubernetes cluster by running `kubectl apply -f nginx.yaml`.

9. Verify that the Nginx server is running by checking the pods with `kubectl get pods`.

10. Access the Nginx server by running `kubectl port-forward pod/nginx-<pod_id> 8181:80`. Replace `<pod_id>` with the actual ID of the Nginx pod obtained from the previous step. Once the port forwarding is established, you can access the Nginx server locally at `http://localhost:8181`.

## Cluster Destruction

To destroy the Kubernetes cluster and associated resources, run `terraform destroy`.

## License

This project is licensed under the MIT License.
