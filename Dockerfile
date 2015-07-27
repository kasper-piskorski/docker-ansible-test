FROM ubuntu:latest

RUN  apt-get update && \
     apt-get install -y git software-properties-common && \
     apt-add-repository ppa:ansible/ansible 

RUN  apt-get update 
 
RUN  apt-get install ansible -y

RUN rm -rf /tmp/ansible-roles/ontoit-cluster
RUN git clone https://github.com/kasper-piskorski/ansible-ontoit-cluster.git /tmp/ansible-roles/ontoit-cluster
ADD inventory /etc/ansible/hosts
ADD run_role.yml /tmp/ansible-roles/run_role.yml

WORKDIR /tmp/ansible-roles

RUN ansible-playbook run_role.yml -e "ROLE=ontoit-cluster"



