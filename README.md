
# Django Devops

*Project test using django, mongodb, docker, ansible and Jenkins.*

### Dev Requirements

 - [Docker](https://www.docker.com/)
 - [Docker Compose](https://docs.docker.com/compose/)

### Deploy Requirements
- [Ansible](https://www.ansible.com/)

### Ci Requirements
- [Jenkins](https://jenkins.io/)

#### Execute Project

    docker-compose up --build
  Access the http://localhost/v1/api/  to see the api
  Access the http://localhost:8081/  to see the mongodb
#### Deploy
Access folder ansible and run:

    ansible-playbook ./config_remote.yml -e "@env_settings/main.yml"
  Need configure hosts in **ansible/host_vars/remote** questions see **ansible/ansible.cfg**
