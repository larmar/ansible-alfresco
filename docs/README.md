# Running with rundeck

- Rundeck installation and configuration is not covered by this guide. 
- Rundeck should be installed with Ansible plugin, so it can run Ansible roles via jobs.
- Rundeck and Ansible should be installed on same host.
- If you use privatekey authentication you should first place private key ssh key to some folder where Rundeck user can read it.

## Step by step guide.

1. [Project creation](project_config.md).
2. [Job configuration](job_config.md).
3. [Running jobs without Ansible hosts](hints.md).