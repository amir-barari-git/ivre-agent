FROM ivre/agent:latest

RUN apt-get update && apt-get install -y openssh-server 

RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN echo "root:Kami1351@" | chpasswd

RUN service ssh restart

CMD ["sh", "-c", "/usr/sbin/sshd -D & /usr/bin/agent"]
