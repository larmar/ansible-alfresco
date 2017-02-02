# Hints

## Runing ansible playbook vs non ansible host.

In some cases you will use different resource model source like files, script or something like that. The question is: "Is it possible to run playbook vs such host". The answer - Yes. 
To do it you should do this trick:

1. Start creating Rundeck job as described at main [job creation](job_config.md) doc.
2. Extra Variables field can be used as with usual Ansible host.
3. In "Extra Ansible arguments" configuration field enter: **-e "ansible_ssh_host=192.168.0.1" -i ",host1"**. Change IP address to IP addrress of destination host, change host1 to destination hostname. The trick here is in comma before hostname. When you enter -i parametr Ansible tries to find corresponging filename, if you enter several comma separated values Ansible works with this "list". You do not need **ansible_ssh_host** if name resolution is configured before.
4. Do not forget to select same Node in Node filter. Just to make everything clear.

You can compare you non Ansible host configuration with configuration of our tests. Screenshot available [here](img/rundeck_node_config_trick.png).