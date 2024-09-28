#!/bin/bash

# Redirect all output to a log file
exec > >(tee -i /var/log/user-data.log)
exec 2>&1

# Update package index
sudo apt update -y

# Install necessary packages
sudo apt install -y software-properties-common

# Add Ansible PPA and update package index
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible and Git
sudo apt install -y ansible git

# Create Ansible directory and navigate into it
mkdir -p ~/Ansible && cd ~/Ansible

# Print the current directory
pwd

# Clone the server-setup repository
git clone https://github.com/Dhiman23/server-setup1.git

# Navigate into the cloned repository
cd server-setup1

# Run the Ansible playbook
ansible-playbook -i localhost configuration.yml