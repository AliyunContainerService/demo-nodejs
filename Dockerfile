FROM node:5.7.1-slim
MAINTAINER Ringtail  <zhongwei.lzw@alibaba-inc.com>

#
# Install and configure a basic SSH server
# 安装并配置SSH server，这个的作用是为了为后文的jenkins集成使用
#RUN apt-get update &&\
#    apt-get install -y git && \
#        apt-get install -y openssh-server &&\
#    apt-get clean -y && rm -rf /var/lib/apt/lists/* &&\
#    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
#   mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
# jenkins slave需要java环境
#RUN apt-get update &&\
#    apt-get install -y openjdk-7-jdk &&\
#    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Set user jenkins to the image
# 设置账号
#RUN adduser --quiet jenkins &&\
#    echo "jenkins:jenkins" | chpasswd

#RUN /usr/sbin/sshd -D &

ADD ./ /workspace

EXPOSE 3000
EXPOSE 22

ENTRYPOINT ["node","/workspace/lib/demo_server.js"]
