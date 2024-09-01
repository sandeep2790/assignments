#!/bin/bash
#
# install java

sudo apt update -y
sudo apt install openjdk-11-jre -y

# install jenkins


curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

# start jenkins


sudo systemctl enable jenkins -y
sudo systemctl start jenkins -y
sudo systemctl status jenkins -#!/bin/bash
#
# Install Java

echo "Updating package index..."
sudo apt update -y

echo "Installing OpenJDK 11 JRE..."
sudo apt install openjdk-11-jre -y

# Install Jenkins

echo "Adding Jenkins repository key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins repository to sources list..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package index again..."
sudo apt-get update -y

echo "Installing Jenkins..."
sudo apt-get install jenkins -y

# Start Jenkins

echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins

# Show Jenkins status

echo "Checking Jenkins status..."
sudo systemctl status jenkins
y#!/bin/bash
#
# Install Java

echo "Updating package index..."
sudo apt update -y

echo "Installing OpenJDK 11 JRE..."
sudo apt install openjdk-11-jre -y

# Install Jenkins

echo "Adding Jenkins repository key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins repository to sources list..."
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

echo "Updating package index again..."
sudo apt-get update -y

echo "Installing Jenkins..."
sudo apt-get install jenkins -y

# Start Jenkins

echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins

# Show Jenkins status

echo "Checking Jenkins status..."
sudo systemctl status jenkins

