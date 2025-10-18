#!/bin/bash

# Jenkins Installation Script for Ubuntu

set -e

echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "☕ Installing Java (OpenJDK 17)..."
sudo apt install -y openjdk-17-jdk

echo "📦 Adding Jenkins repository key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "📚 Adding Jenkins repository to sources list..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🔄 Updating package list..."
sudo apt update

echo "🚀 Installing Jenkins..."
sudo apt install -y jenkins

echo "▶️ Starting and enabling Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "✅ Jenkins installation completed."
echo "📄 Initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "🌐 Visit: http://<your-server-ip>:8080 to access Jenkins"


