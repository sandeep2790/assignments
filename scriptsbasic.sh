#!/bin/bash

# Update package index
echo "Updating package index..."
sudo apt update -y

# Install Java (OpenJDK 11)
echo "Installing Java (OpenJDK 11)..."
sudo apt install -y openjdk-11-jdk

# Verify Java installation
java_version=$(java -version 2>&1 | head -n 1 | cut -d '"' -f 2)
echo "Java version installed: $java_version"

# Set JAVA_HOME environment variable
echo "Setting JAVA_HOME..."
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile
source /etc/profile

# Install Jenkins
echo "Adding Jenkins repository key..."
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

echo "Adding Jenkins repository..."
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

echo "Updating package index..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

# Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Enable Jenkins to start on boot
echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

# Print Jenkins status
echo "Jenkins installation completed. Jenkins status:"
sudo systemctl status jenkins --no-pager

# Print Jenkins initial admin password
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

