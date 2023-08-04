#!/bin/bash
    echo "Install Java"

    sudo apt update
    sudo apt-get install -y openjdk-11-jre
    
    echo " Install Jenkin server"

    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt-get update

    sudo apt-get install -y jenkins

    sudo systemctl start jenkins.service

    sudo systemctl status jenkins

    echo "Install Python"
    sudo apt-get update
    sudo apt-get install  -y python3