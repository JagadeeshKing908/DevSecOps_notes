Self-Intro :-
-----------
Hi, my name is Jagadeesh Yeddula. I am working as an AWS DevOps Engineer with over 3 years of experience in designing, automating, and managing cloud infrastructure and CI/CD processes.
In my current role at CGI, I work on building and maintaining cloud-native environments using AWS services, Kubernetes, Terraform, Jenkins, and GitOps practices. My primary responsibilities include provisioning AWS infrastructure using Terraform, managing containerized applications on Amazon EKS, creating CI/CD pipelines, and implementing automation to improve deployment efficiency.

I have hands-on experience with AWS services like EC2, VPC, IAM, S3, RDS, ELB, Auto Scaling, CloudWatch, and EKS. On the Kubernetes side, I have worked with deployments, services, ingress, Helm charts, scaling, troubleshooting, and application deployments.

For CI/CD automation, I have worked with Jenkins integrated with GitHub webhooks, Maven builds, SonarQube quality gates, and Trivy security scanning to implement DevSecOps practices. I have also implemented GitOps workflows using ArgoCD to automate Kubernetes deployments and maintain consistency between Git repositories and clusters.

I have strong experience in Infrastructure as Code using Terraform, including writing reusable modules, managing remote state, and provisioning AWS resources across different environments. I also have experience with Linux administration and Bash scripting for automation and troubleshooting.

Recently, I have been expanding my knowledge in Azure services, especially AKS and Azure DevOps, to strengthen my multi-cloud skills. I am also exploring how AI tools can help improve automation and troubleshooting workflows in DevOps.

Overall, I enjoy solving infrastructure challenges, automating repetitive tasks, and building reliable, scalable deployment platforms. I am looking for opportunities where I can contribute my DevOps skills while continuing to grow in cloud-native technologies.

Day to day activities :-
---------------------

In my current role as an AWS DevOps Engineer at CGI, my day typically starts by checking the health of our production and non-production environments. I review monitoring dashboards in Prometheus, Grafana, and AWS CloudWatch to identify any alerts, failed deployments, or infrastructure issues.

I then monitor our Jenkins pipelines to ensure builds and deployments have completed successfully. If a pipeline fails, I analyze the logs, identify the root cause, and work with the development team to resolve issues related to build failures, code quality, or deployment.

A major part of my work involves provisioning and managing AWS infrastructure using Terraform. This includes creating or updating resources such as EKS clusters, IAM roles, VPCs, EC2 instances, security groups, and load balancers while maintaining reusable Terraform modules and remote state.

I also manage Kubernetes workloads running on Amazon EKS. My responsibilities include deploying applications using Helm charts, troubleshooting pod or node issues, configuring Deployments, Services, Ingress, ConfigMaps, and Secrets, monitoring cluster health, and ensuring smooth application releases.

I work closely with developers to containerize applications using Docker and automate deployments through Jenkins and ArgoCD. We follow a GitOps approach, where approved changes in Git are automatically synchronized to Kubernetes clusters using ArgoCD.

From a DevSecOps perspective, I integrate SonarQube and Trivy into our CI/CD pipelines to ensure code quality and security vulnerabilities are addressed before deployment.

I also participate in production support activities, investigate incidents, perform root cause analysis, optimize deployment processes, and automate repetitive operational tasks using Bash scripting. Additionally, I collaborate with developers, QA teams, and cloud architects during sprint planning, releases, and infrastructure changes to ensure reliable and efficient software delivery.

Major incident or problem :-
--------------------------

“Yeah, one major production incident I handled was during a peak business event when application traffic suddenly increased by almost 3x compared to normal traffic.

- Users started reporting:

- Slow application response

- Request timeouts

  - Intermittent 5xx errors

  - We immediately received alerts from Prometheus and Grafana for:

High CPU utilization

Increased latency

Pod resource exhaustion

My first step was to identify whether it was an application issue or a traffic-related issue.

I checked:
```bash
- kubectl top pods
- kubectl get hpa kubectl get nodes
```
- We found that traffic had increased significantly and the existing pod replicas were not enough to handle the load.

Immediate actions:

Increased pod replicas

Verified HPA functionality

Checked Cluster Autoscaler

Added additional worker nodes automatically

At the same time, we monitored:

CPU utilization

Memory consumption

Request latency

Error rate

Once additional pods and nodes came online, the application stabilized and response times returned to normal.

Post-incident actions:

Increased HPA thresholds

Fine-tuned resource requests and limits

Performed load testing

Updated capacity planning documentation

The entire incident resolved with in the SLA.The key learning was to proactively prepare for traffic spikes and ensure auto-scaling policies are properly tuned before major business events.

Incident 1: Kubernetes Pods Not Starting (CrashLoopBackOff)
------------------------------------------------------------

One of the production issues I handled was an application deployment where the pods started going into the CrashLoopBackOff state after a new release.

I first checked the pod status using kubectl get pods, then inspected the events with kubectl describe pod, and finally reviewed the application logs using kubectl logs.

The logs showed that the application was failing because a required environment variable from a Kubernetes Secret was missing after the deployment.

We corrected the Secret, redeployed the application through ArgoCD, and verified that all pods were healthy before closing the incident.

After that incident, we added validation checks to our deployment process to ensure required Secrets and ConfigMaps were present before deployment.

Incident 2: Jenkins Pipeline Failure
------------------------------------
We experienced a deployment failure where the Jenkins pipeline failed during the deployment stage.

I reviewed the Jenkins console output and found that the Kubernetes authentication token used by Jenkins had expired.

I updated the Kubernetes credentials in Jenkins, reran the pipeline, and verified the deployment.

To reduce the chance of the same issue happening again, we documented the credential rotation process and scheduled regular reviews of service account credentials.

Incident 3: Terraform Apply Failed
-----------------------------------
During an infrastructure deployment, the Terraform pipeline failed because the state file was locked.

I verified that another pipeline execution had been interrupted while holding the state lock.

After confirming that no active Terraform operation was running, I safely released the lock, reran the deployment, and it completed successfully.

We later improved our pipeline process to avoid concurrent Terraform executions.

We encountered a Terraform state lock after a previous deployment was interrupted. Instead of immediately removing the lock, I first confirmed that no other Terraform operation was in progress. After verifying that the lock was stale, I used 

```bash
terraform force-unlock
```
#### 1. How do I know the Lock ID?

When Terraform fails because of a lock, it usually displays the lock information. to release it and reran the deployment. This resolved the issue without risking state corruption, and we later improved our pipeline to prevent concurrent Terraform executions.

```text
Error: Error acquiring the state lock

Lock Info:

ID:        8d0c62d2-3b8b-7e54-f4cd-2e92d0b52b11  --->LockId
Path:      terraform.tfstate
Operation: OperationTypeApply
Who:       jagadeesh@jenkins-server
Version:   1.6.2
Created:   2026-07-09 10:15:23 UTC
```
Info:
   - 2. How do I know if someone is still running Terraform?
       
       - Scenario 1: Jenkins Pipeline (Most Common)
           - If your team uses Jenkins:
           - Open Jenkins.
              - Check whether the pipeline is still Running.
              - If it is still running, do not unlock.
               ```text
                   Build #120  Running ✅
               ```
      - Scenario 2: Linux Server
          ```bash
           - ps -ef | grep terraform
           - ec2-user  12345  terraform apply
         ```
     - Scenario 3: CI/CD Tool
         If you're using:
       
            GitHub Actions
            Azure DevOps
            GitLab CI
            Bamboo
            Check whether the pipeline is still running.
       
     

Incident 4: High CPU Usage
--------------------------
We received alerts from Prometheus indicating high CPU utilization for one of our microservices.

I used Grafana dashboards to identify the affected service, checked Kubernetes metrics, and reviewed the application logs.

We found that a recent code change had introduced an inefficient database query, causing excessive CPU usage.

The development team optimized the query, and we also configured Horizontal Pod Autoscaler to better handle traffic spikes.

Incident 5: EKS Worker Nodes Not Joining the Cluster
-----------------------------------------------------

During an Amazon EKS cluster deployment using Terraform, the managed node group failed with a NodeCreationFailure error because the EC2 instances were not joining the cluster.

I investigated the node group status, checked the IAM role attached to the worker nodes, reviewed the security groups, and verified the networking configuration.

The issue was caused by an incorrect IAM configuration that prevented the nodes from registering with the Kubernetes control plane.

After correcting the IAM configuration and recreating the node group, the worker nodes successfully joined the cluster.

1. EKS Worker Nodes Not Joining the Cluster

### Interviewer:

If the worker nodes were not joining the EKS cluster, what was wrong with the IAM role?

Answer :

When an EC2 instance is created as an EKS worker node, it needs an IAM role (Node Instance Role). This role allows the node to:

Communicate with the EKS control plane.
Pull container images from ECR.
Join the Kubernetes cluster.

If the IAM role is missing required permissions, the node launches successfully, but it cannot register itself with the EKS control plane.

- The required AWS managed policies are:

        - AmazonEKSWorkerNodePolicy
        - AmazonEC2ContainerRegistryReadOnly
        - AmazonEKS_CNI_Policy

```text

EC2 Instance Starts
        │
        ▼
Attempts to join EKS
        │
        ▼
IAM Role doesn't have required permissions
        │
        ▼
Authentication fails
        │
        ▼
NodeCreationFailure

```
### How did I troubleshoot?

1. I checked: 
```bash
  aws eks describe-nodegroup
```
#### The error showed:
         NodeCreationFailure
         Instances failed to join the kubernetes cluster
#### Then I verified:

- IAM Role
- Security Groups
- VPC/Subnets
- aws-auth ConfigMap (for self-managed nodes)

Incident 6: ArgoCD Out of Sync
------------------------------
There was a situation where ArgoCD showed an application as OutOfSync and changes were not being applied.

I checked the ArgoCD application events, reviewed the Git repository, and inspected the Kubernetes resources.

I found that a manual change had been made directly in the cluster, causing configuration drift.

I synchronized the application from Git and reminded the team to avoid manual production changes, reinforcing our GitOps workflow.

Explain Your AWS Architecture :-
--------------------------------

Interview Answer (Optimized & Natural):

"Sure. In my current project, we use AWS EKS to run our microservices-based applications.

User traffic comes through Route53 and reaches an Application Load Balancer, which forwards requests to the NGINX Ingress Controller inside EKS. From there, traffic is routed to the respective microservices running as Kubernetes deployments.

we have a VPC spread across multiple Availability Zones. Inside the VPC, we have public and private subnets. The Application Load Balancer and NAT Gateways are placed in public subnets, while EKS worker nodes, applications, and databases run in private subnets for security. Route53 is used for DNS routing, and Security Groups and NACLs control network access.

For the database layer, we use RDS Multi-AZ for high availability. If the primary database fails, AWS automatically fails over to the standby instance. For read-heavy workloads, we use read replicas .

For CI/CD, developers push code to Git, which triggers Jenkins pipelines. The pipeline performs code build, testing, security scanning, Docker image creation, pushes the image to ECR, and then deploys it to EKS. For production releases, we use rolling updates, canary deployments, and blue-green deployments to achieve zero downtime

For monitoring and observability, we use Prometheus, Grafana, CloudWatch, Prometheus collects metrics from Kubernetes, nodes, and applications. Grafana provides dashboards for CPU, memory, latency, error rates, and pod health. We configure alerts in Prometheus and Grafana

From a security perspective, we use IAM roles, RBAC, Security Groups, Secrets Manager, and encryption using KMS and TLS.

Overall, the architecture is designed for high availability, scalability, security, and zero-downtime deployments."

ensure high availability, everything is deployed across multiple Availability Zones. The ALB distributes traffic across healthy targets, Kubernetes provides self-healing by automatically recreating failed pods, Auto Scaling handles traffic spikes, and RDS Multi-AZ provides database failover. We also maintain backups and disaster recovery procedures to handle regional failures.

*claude ai in your project :-
we implemented Claude AI as an operational assistant to help engineers with troubleshooting, log analysis, and knowledge retrieval.Through this to we reduce the time engineers spent manually analyzing logs and searching through documentation during incidents.

We integrated Claude AI using its API. Whenever an alert was triggered from monitoring tools like Grafana or Datadog, relevant logs and error messages were collected and passed to Claude through a backend service. Claude would analyze the logs , summarize the issue, identify possible root causes, and suggest troubleshooting steps.

For example, if an application was throwing database connection errors, instead of manually reviewing thousands of log entries, engineers could submit the logs to Claude and get a concise summary along with likely causes and recommended actions.

We also integrated internal runbooks and documentation so engineers could ask questions in natural language, such as 'How do I troubleshoot a pod in CrashLoopBackOff?' and get instant guidance.The result was faster incident triaging, reduced MTTR, and improved productivity for the SRE and support teams. My involvement was mainly around API integration, automation workflows, monitoring integration, and validating the AI-generated responses before production rollouts.

Q) WHAT IS YOUR CLUSTER SIZE ?
------------------------------

Yes. In our project, we maintain two Kubernetes clusters: one for Production and another for Non-Production (dev,test) environments. We keep them separate to ensure production workloads are isolated from development and testing activities.

Our production cluster consists of three master nodes for high availability and ten worker nodes. Each worker node is configured with 4 vCPUs, 16 GB of RAM, and 100 GB of SSD storage. Based on application demand, the worker nodes are configured with an Auto Scaling Group, allowing the cluster to scale up to 20 worker nodes during peak traffic.

For our workloads, a typical pod is configured with resource requests of 0.5 vCPU and 1 GB of memory

We use an internet-facing Application Load Balancer to receive external traffic. Inside the cluster, an Ingress Controller manages incoming HTTP/HTTPS requests and routes them to the appropriate services based on host names and URL paths.

To ensure fair resource usage, we configure ResourceQuotas for each namespace. For example, a namespace can use up to 10 vCPUs and 100 GB of memory. We organize our workloads into separate namespaces such as dev, test, production, monitoring, and application namespaces for better isolation and management.

For storage, we use Amazon EBS-backed Persistent Volumes for stateful applications. Sensitive information such as database passwords, API keys, and SSH keys is stored securely using Kubernetes Secrets.

To improve availability and performance, we use Horizontal Pod Autoscalers (HPA), which automatically increase or decrease the number of pods based on CPU or memory utilization.

For monitoring and observability, we use Prometheus to collect metrics and Grafana to visualize dashboards and monitor cluster health. We also configure alerting so the operations team is notified immediately if any critical issues occur.

We implement Kubernetes RBAC to provide role-based access control, ensuring users and teams have only the permissions they require.

Our application deployments are fully automated through Jenkins CI/CD pipelines. Docker images are stored in our container registry, and we use the Rolling Update deployment strategy to deploy new application versions with zero or minimal downtime.

Finally, we perform regular backups of persistent data and have a documented disaster recovery process that is periodically tested to ensure business continuity.


Q) Why should we hire you?
--------------------------
"I have around 3 years of hands-on DevOps experience working with AWS, Kubernetes, Terraform, Jenkins, Docker, monitoring, and CI/CD automation. I enjoy solving production issues, automating deployments, and continuously learning new technologies. I believe I can contribute quickly while continuing to grow with the team."

Q) What kind of vulnerabilities or code smells have SonarQube/Trivy actually caught for you?
----------------------------
Prepare a real example if possible — e.g., SonarQube flagging code duplication, unused variables, or security hotspots; Trivy catching outdated base images with known CVEs before they reached production. Even a general but honest example works: "Trivy has caught outdated base images with known CVEs before they reached production, which we then patched by updating to a newer, patched image version."

Q)can you tell me your cluster size or your architecture of your project flow ?
------------------------------------------------------------------------------
In my project, we followed a production-grade AWS DevOps architecture. We maintained separate environments for Development, UAT, and Production, with each environment isolated in its own AWS account or VPC depending on the project requirements.

Our applications were deployed on Amazon EKS. The infrastructure, including VPCs, subnets, IAM roles, security groups, EKS clusters, and node groups, was provisioned using Terraform modules to ensure consistency across environments.

Developers pushed code to GitHub, which triggered Jenkins pipelines through GitHub webhooks. The pipeline performed source checkout, Maven build, unit testing, SonarQube code quality analysis, Docker image creation, Trivy vulnerability scanning, and then pushed the image to Amazon ECR.

Instead of deploying directly from Jenkins to Kubernetes, we followed a GitOps approach. Jenkins updated the Kubernetes manifest or Helm chart repository with the new image tag, and ArgoCD continuously monitored that repository. Once it detected the change, it synchronized the application automatically to the EKS cluster.

For monitoring, we used Prometheus and Grafana to collect application and cluster metrics, while AWS CloudWatch was used for infrastructure monitoring and log collection. Alerts were configured to notify the operations team whenever CPU, memory, or pod health crossed defined thresholds.

```bash

                    Developers
                         │
                         ▼
                     GitHub Repository
                         │
                  (GitHub Webhook)
                         │
                         ▼
                     Jenkins Pipeline
                         │
      ┌──────────────────┼──────────────────┐
      ▼                  ▼                  ▼
 Maven Build      SonarQube Scan      Trivy Scan
      │
      ▼
 Build Docker Image
      │
      ▼
 Push Image to Amazon ECR
      │
      ▼
 Update Helm Chart / Kubernetes Manifest (Git)
      │
      ▼
        ArgoCD (GitOps)
      │
      ▼
      Amazon EKS Cluster
      │
 ┌────┴───────────────────────┐
 ▼                            ▼
Application Pods        Kubernetes Services
      │
      ▼
AWS Load Balancer / Ingress
      │
      ▼
        End Users

Monitoring:
Prometheus → Grafana
AWS CloudWatch

```
###### Infrastructure Architecture

```bash

AWS
│
├── VPC
│
├── Public Subnets
│      │
│      └── AWS Load Balancer
│
├── Private Subnets
│      │
│      ├── EKS Worker Nodes
│      │       ├── Application Pods
│      │       ├── ArgoCD
│      │       ├── Prometheus
│      │       └── Grafana
│      │
│      └── Auto Scaling
│
├── Amazon ECR
│
├── IAM Roles
│
├── CloudWatch
│
└── S3 (Terraform Backend)

```
