# GitHub Actions Notes

## What is GitHub Actions?

GitHub Actions is a CI/CD (Continuous Integration and Continuous Delivery) platform provided by GitHub that automates software development workflows such as building, testing, scanning, and deploying applications.

It allows developers and DevOps engineers to automatically execute tasks whenever specific events occur in a GitHub repository.

### Benefits

* Automates build, test, and deployment processes.
* Reduces manual effort.
* Integrates directly with GitHub repositories.
* Supports Linux, Windows, and macOS runners.
* Enables CI/CD without requiring separate tools.

---

# GitHub Actions Workflow Lifecycle

```text
Developer Pushes Code
        │
        ▼
Event Triggered
        │
        ▼
Workflow Starts
        │
        ▼
Runner Created
        │
        ▼
Job Executes
        │
        ▼
Steps Run Sequentially
        │
        ▼
Workflow Completes
```

---

# Core Components of GitHub Actions

## 1. Workflow

A workflow is an automated process defined in a YAML file.

Location:

```text
.github/workflows/
```

Example:

```text
.github/workflows/deploy.yml
```

A repository can contain multiple workflows.

Examples:

* Build workflow
* Test workflow
* Deployment workflow
* Security scan workflow

---

## 2. Event

An event triggers a workflow.

Common Events:

| Event             | Description                     |
| ----------------- | ------------------------------- |
| push              | Code pushed to repository       |
| pull_request      | Pull request created or updated |
| release           | New release created             |
| schedule          | Runs on a schedule (cron)       |
| workflow_dispatch | Manual execution                |
| issue_comment     | Comment added to issue          |

Example:

```yaml
on:
  push:
```

Meaning:

Run workflow whenever code is pushed.

---

## 3. Job

A job is a collection of steps executed on the same runner.

Example:

```yaml
jobs:
  build:
  test:
  deploy:
```

Jobs can run:

### Parallel Execution

```text
Build
Test
Security Scan
```

### Sequential Execution

```text
Build
  ↓
Test
  ↓
Deploy
```

Using:

```yaml
needs:
```

Example:

```yaml
deploy:
  needs: test
```

Deploy starts only after test succeeds.

---

## 4. Step

A step is an individual task inside a job.

Example:

```yaml
steps:
  - run: echo "Build Started"
  - run: mvn clean package
```

Steps execute in sequence.

---

## 5. Action

An action is a reusable automation component.

Instead of writing scripts repeatedly, we use actions.

Example:

```yaml
uses: actions/checkout@v4
```

Purpose:

* Clones repository code to runner.

Popular Actions:

```yaml
actions/checkout
```

Downloads repository code.

```yaml
actions/setup-java
```

Installs Java.

```yaml
actions/setup-node
```

Installs NodeJS.

```yaml
docker/login-action
```

Docker authentication.

```yaml
aws-actions/configure-aws-credentials
```

AWS authentication.

---

## 6. Runner

A runner is the server that executes jobs.

GitHub Hosted Runners:

```yaml
runs-on: ubuntu-latest
```

```yaml
runs-on: windows-latest
```

```yaml
runs-on: macos-latest
```

Characteristics:

* Temporary virtual machine.
* Fresh environment for each workflow run.
* Automatically destroyed after completion.

---

## 7. Self-Hosted Runner

Instead of GitHub-hosted runners, organizations can use their own servers.

Advantages:

* More control.
* Custom software installation.
* Access to internal resources.
* Better performance for large workloads.

Example:

```text
AWS EC2
On-Premise Server
Virtual Machine
```

---

# Basic Workflow Example

```yaml
name: Build Application

on:
  push:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Display Message
        run: echo "Hello GitHub Actions"

      - name: List Files
        run: ls -lrt
```

---

# Important Keywords

## name

Workflow name.

```yaml
name: Build Application
```

---

## on

Defines trigger event.

```yaml
on:
  push:
```

---

## jobs

Defines all jobs.

```yaml
jobs:
```

---

## runs-on

Defines runner OS.

```yaml
runs-on: ubuntu-latest
```

---

## steps

Defines tasks inside job.

```yaml
steps:
```

---

## run

Executes shell commands.

```yaml
run: ls -lrt
```

---

## uses

Uses a reusable action.

```yaml
uses: actions/checkout@v4
```

---

## needs

Creates job dependency.

```yaml
needs: build
```

---

# Common Variables

Repository Name

```yaml
${{ github.repository }}
```

Example Output:

```text
jagadeesh/demo-app
```

---

Branch Name

```yaml
${{ github.ref }}
```

---

Triggered User

```yaml
${{ github.actor }}
```

---

Event Name

```yaml
${{ github.event_name }}
```

---

Workspace Path

```yaml
${{ github.workspace }}
```

---

Job Status

```yaml
${{ job.status }}
```

---

# DevOps CI/CD Example

```text
Developer Pushes Code
        │
        ▼
GitHub Actions Triggered
        │
        ▼
Checkout Source Code
        │
        ▼
Build Application
        │
        ▼
Run Unit Tests
        │
        ▼
Build Docker Image
        │
        ▼
Push Image to ECR
        │
        ▼
Deploy to EKS
```

---

# GitHub Actions vs Jenkins

| Feature        | GitHub Actions            | Jenkins              |
| -------------- | ------------------------- | -------------------- |
| Setup          | Easy                      | Complex              |
| Maintenance    | Minimal                   | Requires maintenance |
| Integration    | Native GitHub Integration | Plugin-based         |
| Infrastructure | Managed by GitHub         | Self-managed         |
| Configuration  | YAML                      | Pipeline Script      |
| Scalability    | Built-in                  | Manual setup         |

---

# Interview Questions

### What is GitHub Actions?

GitHub Actions is a CI/CD platform that automates software build, test, deployment, and repository workflows.

### What is a Workflow?

A workflow is an automated process defined in a YAML file.

### What is an Event?

An event is an activity that triggers a workflow.

### What is a Job?

A job is a collection of steps executed on the same runner.

### What is a Step?

A step is an individual task executed within a job.

### What is an Action?

An action is a reusable automation component used inside workflows.

### What is a Runner?

A runner is the server or virtual machine that executes jobs.

### Difference Between GitHub Hosted and Self-Hosted Runner?

GitHub Hosted:

* Managed by GitHub.
* Temporary VM.
* No maintenance.

Self-Hosted:

* Managed by organization.
* Runs on own servers.
* Full control over environment.
