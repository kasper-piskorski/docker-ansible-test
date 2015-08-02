FROM debian:latest

RUN  apt-get update && \
     apt-get install -y bash git nano tar unzip wget software-properties-common && \

#RUN  apt-add-repository -y ppa:ansible/ansible 

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list
RUN echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list

RUN  apt-get update 
 
RUN  apt-get install -y ansible 

RUN rm -rf /tmp/ansible-roles/ontoit-cluster
RUN git clone https://github.com/kasper-piskorski/ansible-ontoit-cluster.git /tmp/ansible-roles/ontoit-cluster
ADD inventory /etc/ansible/hosts
ADD run_role.yml /tmp/ansible-roles/run_role.yml

WORKDIR /tmp/ansible-roles

RUN ansible-playbook run_role.yml -e "ROLE=ontoit-cluster"
