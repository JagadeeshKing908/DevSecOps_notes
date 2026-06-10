# 🚀 Jenkins Complete Notes

---

# 📖 What is Jenkins?

Jenkins is an **Open Source CI/CD Automation Tool** used to automate:

* Build
* Test
* Code Analysis
* Docker Build
* Deployment

### CI/CD Flow

```text
Developer Pushes Code
         │
         ▼
      Jenkins
         │
         ▼
       Build
         │
         ▼
        Test
         │
         ▼
     SonarQube
         │
         ▼
    Docker Build
         │
         ▼
      Deploy
```

---

# 🎯 Why Jenkins?

Without Jenkins:

```text
Developer
    │
    ▼
Build Manually
    │
    ▼
Test Manually
    │
    ▼
Deploy Manually
```

Problems:

* Human Errors
* Slow Deployments
* Not Scalable
* Repetitive Tasks

With Jenkins:

```text
Push Code
    │
    ▼
 Jenkins
    │
    ▼
 Everything Automated
```

---

# 🏗 Jenkins Architecture

```text
                 Controller
                     │
      ┌──────────────┼──────────────┐
      │              │              │
      ▼              ▼              ▼
   Agent-1        Agent-2        Agent-3
```

## Controller (Master)

Responsibilities:

* Manage Jobs
* Manage Agents
* Manage Plugins
* Store Credentials
* Schedule Builds

## Agent (Node)

Responsibilities:

* Execute Builds
* Run Tests
* Run Deployments
* Run Docker Commands

---

# 📦 Jenkins Job

A Job is a task performed by Jenkins.

Examples:

* Build Application
* Run Tests
* Deploy Application
* Backup Database

---

# 🔄 Jenkins Pipeline

Pipeline = Complete CI/CD Workflow

Stored in:

```text
Jenkinsfile
```

Example:

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Application'
            }
        }
    }
}
```

---

# 📄 Jenkinsfile

Pipeline as Code.

Example:

```groovy
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/user/repo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                sh 'scp app.war server:/opt'
            }
        }

    }
}
```

---

# 🔥 Pipeline Stages

```text
Checkout
   │
   ▼
Build
   │
   ▼
Test
   │
   ▼
SonarQube Scan
   │
   ▼
Package
   │
   ▼
Docker Build
   │
   ▼
Docker Push
   │
   ▼
Deploy
```

---

# 🖥 Agent

Defines where Pipeline runs.

```groovy
agent any
```

Specific Agent:

```groovy
agent {
    label 'linux'
}
```

---

# 🏗 Stage

Represents a phase.

```groovy
stage('Build')
stage('Test')
stage('Deploy')
```

---

# ⚙ Steps

Commands executed inside stages.

```groovy
steps {
    sh 'pwd'
}
```

---

# 🐧 Common Linux Commands

```bash
pwd
ls -lrth
whoami
df -h
free -m
top
```

---

# ☕ Maven Commands

Build Application:

```bash
mvn clean package
```

Compile:

```bash
mvn compile
```

Run Tests:

```bash
mvn test
```

Package:

```bash
mvn package
```

---

# 🐳 Docker Commands

Build Image:

```bash
docker build -t app:v1 .
```

Run Container:

```bash
docker run -d app:v1
```

List Images:

```bash
docker images
```

Push Image:

```bash
docker push app:v1
```

---

# ☸ Kubernetes Commands

Deploy:

```bash
kubectl apply -f deployment.yaml
```

Get Pods:

```bash
kubectl get pods
```

Get Services:

```bash
kubectl get svc
```

Delete Deployment:

```bash
kubectl delete -f deployment.yaml
```

---

# 🚦 Jenkins Triggers

## 1. Manual Trigger

```text
Build Now
```

Equivalent in GitHub Actions:

```yaml
workflow_dispatch:
```

---

## 2. GitHub Webhook

Triggers on:

* Push
* Pull Request
* Merge

```text
GitHub
   │
   ▼
Webhook
   │
   ▼
Jenkins
```

---

## 3. Poll SCM

Checks repository periodically.

Example:

```text
H/5 * * * *
```

Runs every 5 minutes.

---

## 4. Scheduled Build

Example:

```text
0 0 * * *
```

Runs daily at midnight.

---

# 🔌 Jenkins Plugins

Plugin = Additional Feature

Without plugins Jenkins provides only basic functionality.

---

# ⭐ Important Plugins

## Git Plugin

Purpose:

* GitHub Integration
* GitLab Integration
* Bitbucket Integration

---

## Pipeline Plugin

Purpose:

* Run Jenkinsfile
* Enable Pipeline Jobs

---

## Maven Integration Plugin

Purpose:

* Build Java Applications

Example:

```bash
mvn clean package
```

---

## SonarQube Scanner Plugin

Purpose:

* Code Quality Analysis
* Security Checks
* Bug Detection

Flow:

```text
Jenkins
   │
   ▼
SonarQube
   │
   ▼
Quality Report
```

---

## Docker Plugin

Purpose:

* Build Docker Images
* Run Containers

---

## Docker Pipeline Plugin

Purpose:

Use Docker commands inside Jenkins Pipeline.

---

## Kubernetes Plugin

Purpose:

* Connect Jenkins to Kubernetes
* Dynamic Agents
* Deploy Applications

---

## Credentials Plugin

Purpose:

Store Secrets Securely

Examples:

* GitHub Token
* DockerHub Credentials
* AWS Keys
* SonarQube Token
* SSH Keys

---

## SSH Plugin

Purpose:

Connect Remote Servers

Examples:

* EC2
* RHEL
* Ubuntu

Deployment Example:

```bash
scp app.war server:/opt
```

---

## Blue Ocean Plugin

Purpose:

Modern Jenkins Dashboard

Provides:

* Better UI
* Pipeline Visualization
* Easy Navigation

---

## Slack Plugin

Purpose:

Send Build Notifications

Examples:

```text
Build Passed ✅
Build Failed ❌
```

---

## Email Extension Plugin

Purpose:

Email Notifications

Examples:

* Build Success
* Build Failure
* Deployment Status

---

## AWS Credentials Plugin

Purpose:

Store AWS Credentials

Used for:

* EC2
* S3
* EKS
* IAM

---

## Ansible Plugin

Purpose:

Run Ansible Playbooks

```bash
ansible-playbook site.yml
```

---

## Nexus Artifact Uploader Plugin

Purpose:

Upload Artifacts to Nexus Repository

Examples:

* JAR
* WAR
* ZIP

---

# 🔐 Jenkins Credentials

Location:

```text
Manage Jenkins
        │
        ▼
   Credentials
```

Store:

* GitHub Token
* DockerHub Password
* AWS Keys
* SonarQube Token
* SSH Keys

---

# 📂 Jenkins Workspace

Default Location:

```bash
/var/lib/jenkins/workspace/
```

Example:

```bash
/var/lib/jenkins/workspace/my-project
```

Purpose:

* Download Source Code
* Store Build Artifacts
* Temporary Files

---

# 🌐 Webhook

Webhook automatically triggers Jenkins when code changes occur.

```text
GitHub
   │
   ▼
Webhook
   │
   ▼
Jenkins
   │
   ▼
Build Starts Automatically
```

---

# 🚀 Complete DevOps Pipeline

```text
GitHub
   │
   ▼
Webhook
   │
   ▼
Jenkins
   │
   ▼
Checkout Code
   │
   ▼
Maven Build
   │
   ▼
SonarQube Scan
   │
   ▼
Docker Build
   │
   ▼
Docker Push
   │
   ▼
Deploy to Kubernetes
```

---

# ⚔ Jenkins vs GitHub Actions

| GitHub Actions    | Jenkins           |
| ----------------- | ----------------- |
| Workflow          | Pipeline          |
| Runner            | Agent             |
| Action            | Plugin            |
| Secrets           | Credentials       |
| YAML File         | Jenkinsfile       |
| workflow_dispatch | Build Now         |
| Actions Tab       | Jenkins Dashboard |

---

# 🎤 Interview Questions

### What is Jenkins?

Jenkins is an open-source CI/CD automation server used to automate software build, testing, and deployment processes.

### What is a Pipeline?

A Pipeline is a sequence of stages defined in a Jenkinsfile.

### What is an Agent?

An Agent is a machine that executes Jenkins jobs.

### What is a Jenkinsfile?

A Jenkinsfile is a Groovy-based file used to define CI/CD pipelines.

### What is a Plugin?

A Plugin extends Jenkins functionality and integrates external tools.

### What is a Webhook?

A Webhook automatically triggers Jenkins when code is pushed to GitHub.

---

# 🧠 Easy Memory Trick

| GitHub Actions    | Jenkins     |
| ----------------- | ----------- |
| Workflow          | Pipeline    |
| Runner            | Agent       |
| Action            | Plugin      |
| Secrets           | Credentials |
| YAML              | Jenkinsfile |
| workflow_dispatch | Build Now   |

### Simple Formula

```text
GitHub Actions
      +
Thousands of Plugins
      +
Self Hosted Server
      =
Jenkins
```
