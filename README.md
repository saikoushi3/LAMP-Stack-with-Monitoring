﻿# 🌐 Project 2: Infrastructure as Code - LAMP Stack with Monitoring

This project automates the provisioning and configuration of a complete **LAMP stack** (Linux, Apache, MySQL, PHP) on AWS using **Terraform** and **Ansible**, with integrated monitoring using **Prometheus** and **Node Exporter**.

---

## 📌 Objective

- Provision infrastructure on AWS using **Terraform**.
- Install and configure the **LAMP stack** on an EC2 instance using **Ansible**.
- Deploy a **sample PHP application**.
- Install and configure **Node Exporter** on the LAMP instance.
- Install and configure **Prometheus** on a separate EC2 instance to monitor the LAMP server.

---

## ⚙️ Tech Stack

- **Infrastructure**: AWS EC2, VPC, Security Groups
- **Automation**: Terraform, Ansible
- **Application Stack**: Apache, MySQL, PHP
- **Monitoring**: Prometheus, Node Exporter
- **Language**: YAML, HCL, PHP
- **Version Control**: Git

---

## 🗂️ File Structure

lamp-monitoring-iac/

├── terraform/

│ ├── main.tf # EC2 & SG provisioning

│ ├── variables.tf # Variables like keypair

│ ├── outputs.tf # Output IPs

├── ansible/

│ ├── inventory.ini # Ansible inventory

│ ├── lamp-playbook.yml # Installs Apache, MySQL, PHP

│ ├── node_exporter.yml # Installs Node Exporter

│ ├── prometheus-playbook.yml # Installs Prometheus

│ ├── roles/

│ │ ├── lamp/

│ │ │ ├── tasks/main.yml

│ │ │ ├── handlers/main.yml

├── php-app/

│ └── index.php # Sample PHP app

└── README.md # Project documentation



---

## 🚀 How to Run the Project

### 🛠️ 1. Clone the Repository

```bash
git clone https://github.com/yourusername/lamp-monitoring-iac.git
cd lamp-monitoring-iac


cd terraform
terraform init
terraform apply -var="key_name=your-key-pair-name"

After completion, note the public IPs of:

LAMP Server

Prometheus Server

Go to the ansible/inventory.ini and replace the placeholder IPs:
[lamp]
<lamp_public_ip> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem

[prometheus]
<prometheus_public_ip> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem


This installs Apache, MySQL, PHP, and deploys a sample PHP file.
cd ../ansible
ansible-playbook -i inventory.ini lamp-playbook.yml


| Service    | URL                                  |
| ---------- | ------------------------------------ |
| PHP App    | `http://<lamp_public_ip>`            |
| Prometheus | `http://<prometheus_public_ip>:9090` |


📋 Sample Output
PHP App:

Hello from LAMP Server!

Prometheus Dashboard:

Access Prometheus UI to view metrics from Node Exporter.


🔐 Security Notes
SSH ports (22) are open for provisioning. You may restrict access after setup.

No authentication is configured for Prometheus in this demo project (not recommended for production).

 Teardown Infrastructure
cd terraform
terraform destroy -var="key_name=your-key-pair-name"



📌 Future Improvements
Add Grafana for dashboard visualization

Use dynamic inventory for Ansible

Automate Prometheus target discovery

