
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Jenkins Master Server Failure
---

Jenkins is a popular automation server used in software development. The master server is the main node that controls the distribution of tasks to worker nodes. A failure in the Jenkins master server can cause a disruption in the automation pipeline, leading to delays in software development and deployment. This type of incident requires immediate attention to restore the Jenkins master server and resume normal operations.

### Parameters
```shell
export JENKINS_NAMESPACE="PLACEHOLDER"

export JENKINS_POD_NAME="PLACEHOLDER"

export JENKINS_DEPLOYMENT_NAME="PLACEHOLDER"

export JENKINS_APP_NAME="PLACEHOLDER"

export NAMESPACE="PLACEHOLDER"

export POD_NAME="PLACEHOLDER"

export JENKINS_SERVICE_NAME="PLACEHOLDER"
```

## Debug

### Get a list of all pods in the Jenkins namespace
```shell
kubectl get pods -n ${JENKINS_NAMESPACE}
```

### Check the status of the Jenkins pod(s)
```shell
kubectl describe pods -n ${JENKINS_NAMESPACE} ${JENKINS_POD_NAME}
```

### Check the logs of the Jenkins pod(s)
```shell
kubectl logs -n ${JENKINS_NAMESPACE} ${JENKINS_POD_NAME}
```

### Check the events related to the Jenkins pod(s)
```shell
kubectl get events -n ${JENKINS_NAMESPACE} --sort-by=.metadata.creationTimestamp
```

### Check the status of the Jenkins deployment
```shell
kubectl describe deployment -n ${JENKINS_NAMESPACE} ${JENKINS_DEPLOYMENT_NAME}
```

### Check the replica set(s) of the Jenkins deployment
```shell
kubectl get rs -n ${JENKINS_NAMESPACE} --selector=app=${JENKINS_APP_NAME}
```

### Check the status of the Jenkins service(s)
```shell
kubectl describe service -n ${JENKINS_NAMESPACE} ${JENKINS_SERVICE_NAME}
```

### Check the network policies affecting the Jenkins pod(s)
```shell
kubectl get networkpolicy -n ${JENKINS_NAMESPACE} --selector=app=${JENKINS_APP_NAME}
```

### Check the storage volume(s) used by the Jenkins pod(s)
```shell
kubectl describe pod -n ${JENKINS_NAMESPACE} ${JENKINS_POD_NAME} | grep -i volume
```

### Check the resource usage of the Jenkins pod(s)
```shell
kubectl top pod -n ${JENKINS_NAMESPACE} ${JENKINS_POD_NAME}
```

### Check the node(s) where the Jenkins pod(s) are running
```shell
kubectl get pods -n ${JENKINS_NAMESPACE} -o wide
```

## Repair

### Restart the Jenkins server to see if it's a temporary issue.
```shell


#!/bin/bash



NAMESPACE=${NAMESPACE}

POD_NAME=${POD_NAME}



kubectl -n ${NAMESPACE} delete pod ${POD_NAME}




```