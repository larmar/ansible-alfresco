# Role Name

This roles install and configure Alfresco community edition to target node. Role can be used with ansible standalone or with rundeck with ansible plugin installed on it.

## Requirements

This role has another roles dependecies covered in dependencies section. Please read dependencies section to exclude roles compatibilies issues.

## Role Variables

```YAML
---
# Role options

alfresco_service_enabled: True                                                  # Permanently enable Alfresco after installation.

# Alfreco config template vars.

alfresco_conf_database_name: "alfresco"                                         # For security reasons it is 
alfresco_conf_db_username: "alfresco"                                           # highly recommended to change this
alfresco_conf_db_password: "alfresco"                                           # three values.

# alfresco_user_store_adminpassword used only for password restore on existing installations
# alfresco_user_store_adminpassword should be NTLM hash
# example to encode admin word in linux console:
# printf '%s' 'admin' | iconv -t utf16le | openssl md4

#alfresco_user_store_adminpassword: "209c6174da490caeb422f3fa5a7ae634"

# DB server settings
# Other PostgreSQL options use https://github.com/ANXS/postgresql defaults.

alfresco_postgresql_version: "9.4"                                              # Tested with 9.4, 9.5
alfresco_postgresql_max_connections: "300"                                      # Alfresco 5.0 recommended value
alfresco_postgresql_default_auth_method: "trust"                                # No need to change with localhost PostgreSQL, Will fail deploy with md5       

alfresco_installation_cleanup: True                                             # Clean up files downloaded to tmp during installation proccess. 
```

## Dependencies

- inssob.utils - This role install some basic utils like unzip, htop, net-tools etc 
- insspb.nginx - This role install and configure nginx server.
- ANXS.postgresql - This role install and configure PostgreSQL. **WARNING** This role should be version 1.5, version 1.7 yum install is broken! Check [this issue](https://github.com/ANXS/postgresql/issues/225).
 
## Installation

### With ansible galaxy:
```
ansible-galaxy install larmar.alfresco
```
### With git:
```
cd /etc/ansible/roles/
git clone git@github.com:larmar/ansible-alfresco.git larmar.alfresco
git clone --branch v2.3 git@github.com:insspb/ansible-role-nginx.git insspb.nginx
git clone --branch v2.3 git@github.com:insspb/ansible-role-utils.git insspb.utils
git clone --branch v1.5.0 git@github.com:ANXS/postgresql.git ANXS.postgresql
```
## Example Playbook
```YAML
---
   - hosts: all
     roles:
         - { role: larmar.alfresco }
```

## Development information

This role is developed with community help. 
Process of development follows this rule: 

 - You are free to add any pool request to develop branch. All request will be answered in timely manner. 
 - If you want to made any contribution, but do not know where to start - check issues.
 - Master branch updated just after significant changes in develop.
 - Please include documentation for new features. 
 - Please use variables.
 - Please do not forget to set defaults.
 - Please do your best to keep backward compatibility if possible.
 - Please use packet installation as default software installation method. Source installation must be optional anywhere if possible.
 - Please use official software developers repositories instead of general Debian/Ubuntu/Centos etc. 
 - Do you best to keep role independent from any other roles. User must have the way to choose what roles to use.

## Tested on

 - CentOS 7 Minimal ISO installation:
   - with PostgreSQL 9.4, PostgreSQL 9.5
   - with ANXS.postgresql verison 1.5.0

## License

MIT

## Author Information

This role is contributed by [Andrey Shpak](http://www.ashpak.ru). I am always available for [hire](https://www.upwork.com/o/profiles/users/_~01a780866aa29e4429/).
This role is contributed and maintained by **Martin Wilderoth**. 
