## Create Rundeck project

First off all we need to create Rundeck project that will use our Ansible hosts file like node source. It is possible to use other resources sources like yaml files, but it will be a little bit harder to config new job.

### Project details

1. Log in to you Rundeck installation. 
2. Click New project.
3. Enter Project name. 
4. Enter Project description. 

### Resource Model Source configuration.

1. Click "Delete" on default Resource Model Source(File).
2. Click "Add Source"
3. Select "Ansible Resource Model Source"
4. Enter "ansible inventory File path" (directory path in our tests).
5. Check "Gather Facts" and "Ignore Host Discovery Errors" boxes marked.
6. Configure "SSH Connection" with password or privatekey auth. System will not work correctly with encrypted privatekeys (password protected). This auth is used on gathering hosts facts on node list request.
7. No become configuration needed on CentOS installations.
8. Click Save

### Project Nodes

For big inventory files it is recommended to increase default 30 seconds cache delay to something like 300 seconds.

### Default Node Executor

In case you want to use password auth for you hosts you should select Stub on project creation, create project, add password to Rundeck key storage, and then edit project with normal values described below.

1. Select "Ansible Ad-Hoc Node Executor"
2. Select "Executable" = /bin/bash (Alfresco required).
3. Setup "SSH Connection". Configure "SSH Connection" with password or privatekey auth. System will not work correctly with encrypted privatekeys (password protected). You can setup SSH Connection on per job basis, but it will use this setup in case of error.
4. No Privilege Escalation needed on CentOS installations.

### Default Node File Copier

In case you want to use password auth for you hosts you should select Stub on project creation, create project, add password to Rundeck key storage, and then edit project with normal values described below.

1. Select "Ansible File Copier"
2. Setup "SSH Connection". Configure "SSH Connection" with password or privatekey auth. System will not work correctly with encrypted privatekeys (password protected).
3. No Privilege Escalation needed on CentOS installations.
4. Click "Create"

## Check Rundeck configured properly

1. Click "Nodes" you should see all nodes located in you Ansible hosts file.

You can check [screenshot](img/rundeck_project_config.png) of our example project on test Rundeck server here.  