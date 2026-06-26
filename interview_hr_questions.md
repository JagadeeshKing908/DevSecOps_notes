Self-Intro :-
-----------

Good morning/afternoon. First of all, thank you for giving me the opportunity to introduce myself.

My name is Jagadeesh. I was born and brought up in Rly Kodur, which is located in Tirupati district, Andhra Pradesh.

I have 3 years of experience as a DevOps Engineer.In my experience we use Linux, Git and GitHub for source code management, 
Jenkins for CI/CD automation, Docker for containerization, Kubernetes for container orchestration, Terraform for Infrastructu
re as Code, and AWS cloud services. I have also worked with SonarQube for code quality analysis, Nexus Repository for 
artifact management, and Prometheus and Grafana for monitoring and alerting.  

Day to day activities :
-----------------------

Yeah, in my current role as a DevOps Engineer, my day-to-day activities mainly involve managing CI/CD pipelines, Kubernetes 
environments, cloud infrastructure, monitoring, and production support.

Then I attend the daily stand-up to discuss ongoing tasks, deployments, and any production issues.

My day-to-day responsibilities include:

- Managing Jenkins CI/CD pipelines
- Deploying applications to AWS EKS
- Monitoring Kubernetes clusters
- Troubleshooting production issues
- Provisioning infrastructure using Terraform
- Managing Docker images and ECR
- Handling alerts, incidents, and RCA activities

I also work closely with developers during releases and ensure deployments are completed smoothly with minimal downtime.
So overall, my focus is on automation, deployments, monitoring, troubleshooting, and maintaining platform reliability.”

So overall, my focus is on automation, CI/CD, cloud infrastructure, Kubernetes operations, monitoring, troubleshooting, and maintaining high availability of the platform.”

Major incident or problem :-
--------------------------

“Yeah, one major production incident I handled was during a peak business event when application traffic suddenly increased 
by almost 3x compared to normal traffic.

Users started reporting:

Slow application response

Request timeouts

Intermittent 5xx errors


We immediately received alerts from Prometheus and Grafana for:

High CPU utilization

Increased latency

Pod resource exhaustion


My first step was to identify whether it was an application issue or a traffic-related issue.

I checked:

kubectl top pods
kubectl get hpa
kubectl get nodes

We found that traffic had increased significantly and the existing pod replicas were not enough to handle the load.

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


The entire incident resolved with in the SLA.The key learning was to proactively prepare for traffic spikes and ensure 
auto-scaling policies are properly tuned before major business events.

Explain Your AWS Architecture :-
------------------------------

Interview Answer (Optimized & Natural):

"Sure. In my current project, we use AWS EKS to run our microservices-based applications.

User traffic comes through Route53 and reaches an Application Load Balancer, which forwards requests to the NGINX Ingress 
Controller inside EKS. From there, traffic is routed to the respective microservices running as Kubernetes deployments.

we have a VPC spread across multiple Availability Zones. Inside the VPC, we have public and private subnets. The Application 
Load Balancer and NAT Gateways are placed in public subnets, while EKS worker nodes, applications, and databases run 
in private subnets for security. Route53 is used for DNS routing, and Security Groups and NACLs control network access.

For the database layer, we use RDS Multi-AZ for high availability. If the primary database fails, AWS automatically fails 
over to the standby instance. For read-heavy workloads, we use read replicas .

For CI/CD, developers push code to Git, which triggers Jenkins pipelines. The pipeline performs code build, testing, security 
scanning, Docker image creation, pushes the image to ECR, and then deploys it to EKS. For production releases, we use rolling 
updates, canary deployments, and blue-green deployments to achieve zero downtime

For monitoring and observability, we use Prometheus, Grafana, CloudWatch, Prometheus collects metrics from Kubernetes, 
nodes, and applications. Grafana provides dashboards for CPU, memory, latency, error rates, and pod health. 
We configure alerts in Prometheus and Grafana


From a security perspective, we use IAM roles, RBAC, Security Groups, Secrets Manager, and encryption using KMS and TLS.

Overall, the architecture is designed for high availability, scalability, security, and zero-downtime deployments."



ensure high availability, everything is deployed across multiple Availability Zones. The ALB distributes traffic across healthy targets, Kubernetes provides self-healing by automatically recreating failed pods, Auto Scaling handles traffic spikes, and RDS Multi-AZ provides database failover. We also maintain backups and disaster recovery procedures to handle regional failures.


*claude ai in your project :-
---------------------------

 we implemented Claude AI as an operational assistant to help engineers with troubleshooting, log analysis, and knowledge 
 retrieval.Through this to we  reduce the time engineers spent manually analyzing logs and searching through documentation 
 during incidents.

We integrated Claude AI using its API. Whenever an alert was triggered from monitoring tools like Grafana or Datadog, 
relevant logs and error messages were collected and passed to Claude through a backend service. Claude would analyze the logs
, summarize the issue, identify possible root causes, and suggest troubleshooting steps.

For example, if an application was throwing database connection errors, instead of manually reviewing thousands of log 
entries, engineers could submit the logs to Claude and get a concise summary along with likely causes and recommended actions.

We also integrated internal runbooks and documentation so engineers could ask questions in natural language, such as 
'How do I troubleshoot a pod in CrashLoopBackOff?' and get instant guidance.The result was faster incident triaging, reduced 
MTTR, and improved productivity for the SRE and support teams. My involvement was mainly around API integration, automation 
workflows, monitoring integration, and validating the AI-generated responses before production rollouts.


Q) Why should we hire you?

"I have around 3 years of hands-on DevOps experience working with AWS, Kubernetes, Terraform, Jenkins, Docker, monitoring, and CI/CD automation. I enjoy solving production issues, automating deployments, and continuously learning new technologies. I believe I can contribute quickly while continuing to grow with the team."

