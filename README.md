# Dockerfile for creating a Linux server
</br>

## Fetching the Dockerfile from the GitHub repository
```
wget https://raw.githubusercontent.com/TeleDark/ubuntu-server-dockerfile/main/Dockerfile
```

## how to build Dockerfile
```
docker build -t t-server .
```

## how to run
```
docker run --name c1 --hostname server --restart always -p 2050:2050/tcp -p 2222:22/tcp -p 2087:2087/tcp -it --privileged  t-server /sbin/init
```
