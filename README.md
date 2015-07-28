#docker-ansible-test

Dockerfile for deploying ansible-ontoit-cluster script in different environments. A valid docker installation is required to run. To change the environment change the initial FROM line in the Dockerfile. 


# Install Docker
Install the latest docker package:
```
wget -qO- https://get.docker.com/ | sh
```
Add user to docker group:
```
sudo usermod -aG docker USER_NAME
```
Start deamon:
sudo service docker start

Verify installation:
```
docker run hello-world
```

# Build & run
To build, change the working directory to directory of the project and type:

```
docker build -t USER_NAME/docker-ansible-test .
```

To run then type:

```
docker run -t -i USER_NAME/docker-ansible-test:latest /bin/bash
```
