pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Ansible') {
            steps {
                sh 'pip install ansible'
            }
        }
        stage('Lint Playbooks') {
            steps {
                sh 'ansible-lint playbook-*.yml'
            }
        }
        stage('Test Playbook') {
            steps {
                ansiblePlaybook playbook: 'playbook-jenkins.yml', inventory: 'inventory.yml', extras: '--check'
            }
        }
    }
}