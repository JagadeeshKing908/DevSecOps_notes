JENKINS COMPLETE NOTES

=================================================

1. WHAT IS JENKINS?
   =================================================

Jenkins is an open-source CI/CD automation tool used to automate:

* Build
* Test
* Code Analysis
* Docker Build
* Deployment

CI = Continuous Integration
CD = Continuous Delivery / Continuous Deployment

Flow:

Developer Pushes Code
↓
Jenkins
↓
Build
↓
Test
↓
SonarQube
↓
Docker Build
↓
Deployment

=================================================
2. WHY JENKINS?
===============

Without Jenkins:

Developer
↓
Build Manually
↓
Test Manually
↓
Deploy Manually

Problems:

* Time consuming
* Human errors
* Not scalable

With Jenkins:

Push Code
↓
Jenkins
↓
Everything Automated

=================================================
3. JENKINS ARCHITECTURE
=======================

```
         Controller
             |
-------------------------
|           |           |
```

Agent-1     Agent-2     Agent-3

Controller (Master):

* Manages Jobs
* Schedules Builds
* Manages Plugins
* Stores Credentials

Agent (Node):

* Executes Jobs
* Runs Builds
* Runs Tests
* Runs Deployments

=================================================
4. JENKINS JOB
==============

A Job is a task executed by Jenkins.

Examples:

* Build Java Application
* Deploy Application
* Backup Database
* Run Tests

=================================================
5. JENKINS PIPELINE
===================

Pipeline = Entire CI/CD Process

Stored in:

Jenkinsfile

Example:

pipeline {
agent any

```
stages {

    stage('Build') {
        steps {
            echo 'Building'
        }
    }

}
```

}

=================================================
6. JENKINSFILE
==============

Jenkinsfile = Pipeline as Code

Stored inside Git Repository.

Example:

pipeline {
agent any

```
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
```

}

=================================================
7. PIPELINE STAGES
==================

Checkout
↓
Build
↓
Test
↓
Code Scan
↓
Package
↓
Docker Build
↓
Push Image
↓
Deploy

=================================================
8. AGENT
========

Defines where pipeline runs.

Examples:

agent any

agent {
label 'linux'
}

agent {
label 'docker'
}

=================================================
9. STAGE
========

Represents a phase in pipeline.

Examples:

stage('Build')
stage('Test')
stage('Deploy')

=================================================
10. STEPS
=========

Commands executed inside stages.

Example:

steps {
sh 'pwd'
}

=================================================
11. COMMON SHELL COMMANDS
=========================

Current Directory

sh 'pwd'

List Files

sh 'ls -lrth'

Current User

sh 'whoami'

Disk Usage

sh 'df -h'

Memory

sh 'free -m'

=================================================
12. MAVEN COMMANDS
==================

Clean Project

mvn clean

Compile

mvn compile

Package

mvn package

Build Application

mvn clean package

Run Tests

mvn test

=================================================
13. DOCKER COMMANDS
===================

Build Image

docker build -t app:v1 .

List Images

docker images

Run Container

docker run -d app:v1

Push Image

docker push app:v1

=================================================
14. KUBERNETES COMMANDS
=======================

Deploy

kubectl apply -f deployment.yaml

Get Pods

kubectl get pods

Get Services

kubectl get svc

Delete Deployment

kubectl delete -f deployment.yaml

=================================================
15. JENKINS BUILD TRIGGERS
==========================

1. Manual Build

Build Now

Equivalent in GitHub Actions:

workflow_dispatch

---

2. GitHub Webhook

Triggers on:

* Push
* Pull Request
* Merge

---

3. Poll SCM

Example:

H/5 * * * *

Runs every 5 minutes.

---

4. Scheduled Build

Cron Jobs

Example:

0 0 * * *

Runs Daily Midnight

=================================================
16. JENKINS PLUGINS
===================

Plugin = Additional Feature

Without plugins Jenkins is very basic.

=================================================
17. IMPORTANT PLUGINS
=====================

1. Git Plugin

Purpose:
Connect Jenkins with:

* GitHub
* GitLab
* Bitbucket

---

2. Pipeline Plugin

Purpose:
Run Jenkinsfile

Without this plugin:
No Pipeline Support

---

3. Maven Integration Plugin

Purpose:
Build Java Applications

Example:

mvn clean package

---

4. SonarQube Scanner Plugin

Purpose:

* Code Quality Check
* Bug Detection
* Vulnerability Detection
* Code Smells

Flow:

Jenkins
↓
SonarQube
↓
Quality Report

---

5. Docker Plugin

Purpose:

* Build Images
* Run Containers

---

6. Docker Pipeline Plugin

Purpose:

Use Docker inside Jenkins Pipeline.

---

7. Kubernetes Plugin

Purpose:

* Connect Jenkins with Kubernetes
* Dynamic Agents
* Deploy Applications

---

8. Credentials Plugin

Purpose:

Store:

* Passwords
* Tokens
* SSH Keys
* AWS Keys

Securely

---

9. SSH Plugin

Purpose:

Connect Linux Servers

Examples:

* EC2
* RHEL
* Ubuntu

Used for Deployment.

---

10. Blue Ocean Plugin

Purpose:

Modern Jenkins UI

Provides:

* Better Dashboard
* Pipeline Visualization

---

11. Email Extension Plugin

Purpose:

Email Notifications

Examples:

Build Success
Build Failure

---

12. Slack Plugin

Purpose:

Send Build Notifications

Examples:

Build Passed
Build Failed

---

13. AWS Credentials Plugin

Purpose:

Store AWS Access Keys

Used for:

* EC2
* S3
* EKS
* IAM

---

14. Ansible Plugin

Purpose:

Run Ansible Playbooks

Example:

ansible-playbook site.yml

---

15. Artifactory Plugin

Purpose:

Store Artifacts

Examples:

* JAR Files
* WAR Files
* ZIP Files

---

16. Nexus Artifact Uploader Plugin

Purpose:

Upload Build Artifacts to Nexus Repository.

=================================================
18. JENKINS CREDENTIALS
=======================

Location:

Manage Jenkins
↓
Credentials

Store:

* GitHub Token
* DockerHub Credentials
* AWS Keys
* SonarQube Token
* SSH Keys

=================================================
19. JENKINS WORKSPACE
=====================

Default Location:

/var/lib/jenkins/workspace/

Example:

/var/lib/jenkins/workspace/my-project

Purpose:

* Downloads Source Code
* Stores Build Files
* Stores Temporary Files

=================================================
20. WEBHOOK
===========

Webhook = Automatic Trigger

GitHub
↓
Webhook
↓
Jenkins
↓
Build Starts

No Manual Build Required.

=================================================
21. COMPLETE DEVOPS PIPELINE
============================

GitHub
↓
Webhook
↓
Jenkins
↓
Checkout Code
↓
Maven Build
↓
SonarQube Scan
↓
Docker Build
↓
Push DockerHub
↓
Deploy to Kubernetes

=================================================
22. JENKINS VS GITHUB ACTIONS
=============================

GitHub Actions        Jenkins

Workflow          →   Pipeline
Runner            →   Agent
Actions           →   Plugins
Secrets           →   Credentials
YAML File         →   Jenkinsfile
workflow_dispatch →   Build Now
Actions Tab       →   Dashboard

=================================================
23. INTERVIEW QUESTIONS
=======================

Q. What is Jenkins?

Jenkins is an open-source CI/CD automation tool used to automate software build, testing, and deployment.

---

Q. What is a Pipeline?

Pipeline is a sequence of automated stages defined in a Jenkinsfile.

---

Q. What is an Agent?

An Agent is a machine that executes Jenkins jobs.

---

Q. What is a Jenkinsfile?

A Jenkinsfile is a Pipeline-as-Code file written in Groovy.

---

Q. What is a Plugin?

A Plugin extends Jenkins functionality and integrates external tools.

---

Q. What is a Webhook?

A Webhook automatically triggers Jenkins when code is pushed to GitHub.

=================================================
24. EASY MEMORY TRICK
=====================

GitHub Actions      Jenkins

Workflow       →    Pipeline
Runner         →    Agent
Action         →    Plugin
Secrets        →    Credentials
YAML           →    Jenkinsfile
workflow_dispatch → Build Now

=================================================
25. MOST USED PLUGINS IN REAL PROJECTS
======================================

Git Plugin
Pipeline Plugin
Maven Integration Plugin
SonarQube Scanner Plugin
Docker Plugin
Docker Pipeline Plugin
Kubernetes Plugin
Credentials Plugin
SSH Plugin
Blue Ocean Plugin
Slack Plugin
Email Extension Plugin
AWS Credentials Plugin
Ansible Plugin
Nexus Artifact Uploader Plugin

These plugins cover most real-world DevOps projects.
