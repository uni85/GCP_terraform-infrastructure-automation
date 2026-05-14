# GCP Infrastructure Automation with Terraform (Challenge Lab)

This repository contains the solution for a Google Cloud Challenge Lab focused on automating infrastructure using Terraform. The project demonstrates advanced skills in modularization, state management, and the lifecycle of cloud resources.

## 🏗️ Architecture Overview
The project involved building a multi-tier network and compute environment on Google Cloud Platform. 

### Key Technical Achievements:
*   **Infrastructure Import:** Successfully imported unmanaged VM instances into Terraform state.
*   **Remote Backend:** Implemented a Google Cloud Storage (GCS) bucket for persistent and shared state management.
*   **Modular Design:** Created custom modules for `instances` and `storage`, and utilized the official Terraform Registry Network module.
*   **Security Architecture:** Provisioned custom VPC subnets and configured ingress firewall rules for TCP port 80.

---

## 📊 Deployment Evidence

### 1. Resource Inventory & State Management
Verified the complete lifecycle management of all resources through the Terraform CLI.

**Command:** `terraform state list`
![Terraform State Inventory](docs/terrastate.png)

### 2. Network Infrastructure
Provisioned a custom VPC with isolated regional subnets using the Terraform Registry.
*   **Network Name:** `tf-vpc-858600`
*   **Subnet 01:** `10.10.10.0/24`
*   **Subnet 02:** `10.10.20.0/24`

![VPC and Subnet Configuration](docs/vpcs.png)

### 3. Compute Instances
Managed the modification of existing VM instances to meet updated hardware specifications (`e2-standard-2`) and connected them to the new custom subnets.

![VM Instance Status](docs/instances.png)

### 4. Firewall & Security Policies
Implemented an ingress firewall rule to permit web traffic (port 80) from any source across the VPC.

![Firewall Rule Configuration](docs/tfirewall.png)

### 5. Remote Backend Implementation
To follow DevOps best practices, the `terraform.tfstate` file was migrated to a secure Cloud Storage bucket.

![GCS Remote Backend](docs/statefile.png)

---

## 🛠️ Infrastructure as Code Implementation

### File Structure
```text
.
├── main.tf          # Root configuration, provider, and modules
├── variables.tf     # Global variables
└── modules/
    ├── instances/   # VM resource definitions
    └── storage/     # GCS bucket for remote state
```
### 🛠️ Key Terraform Commands

These commands represent the core workflow used to manage the infrastructure lifecycle during this project.


# 1. Initialize the working directory and download necessary providers/modules
```bash
terraform init
```

# 2. Import existing, unmanaged Google Cloud instances into the Terraform state
```bash
terraform import module.instances.google_compute_instance.tf-instance-1 tf-instance-1
terraform import module.instances.google_compute_instance.tf-instance-2 tf_instance-2
```
# 3. Preview and execute the actions required to reach the desired state
```bash
terraform apply -auto-approve
```
# 4. Verify the resources currently managed by the state file
```bash
terraform state list
```
