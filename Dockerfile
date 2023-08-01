FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y systemd vim openssh-server curl net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# set your root password 
RUN echo 'root:RootPassword' | chpasswd

RUN service ssh start

EXPOSE 2050 22 2087

CMD ["/lib/systemd/systemd"]
