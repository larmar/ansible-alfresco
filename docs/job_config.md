# Job configuration

Only required options covered here. To know more - check [Rundeck documentation](http://rundeck.org/docs/).

## Create Rundeck Job

1. Log in to you Rundeck installation. 
2. Select you Alfresco related project
3. Click Jobs in upper menu.
4. Click Job Actions --> New Job

## Main job configuration

1. Enter "Job Name"
2. Select "Dispatch to Nodes" and enter(select) all nodes to run this job on. It can be one node by name, several nodes by comma separated names, or vs some tag.
3. Check all other available options. They are not required, but maybe helpful. 

## Workflow configuration.

1. Select Parallel strategy, so this job will run via several hosts in same time. 
2. Click "Add a step" in Workflow menu.
3. Select "Workflow steps"
4. Select "Ansible playbook"
5. In **Playbook** field enter full path to [alfresco example playbook](../alfresco.yml) or you own playbook example.
6. In **Extra Variables** you can enter any values supported by Alfresco role. so you have two configuration options. First one to use default [Ansible host_vars/group_vars](http://docs.ansible.com/ansible/intro_inventory.html) files, or to use Job **Extra Variables** to keep you role configuration. We are using Rundeck **Extra Variables** so configuration can be edited with web interface.
7. Configure **SSH Connection** in same way you done it on project creation or ignore it.
8. No Privilege Escalation needed on CentOS installations.
9. It is recommended to make **Step Label** comment.
10. Click save.

You can validate you settings with our tests server job [screenshot](img/rundeck_job_config.png).