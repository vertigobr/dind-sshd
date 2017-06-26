#
# Official dind with sshd
#
FROM docker:stable-dind

LABEL maintainer andre@vertigo.com.br

RUN apk --update add openssh python sudo shadow && \
    /usr/bin/ssh-keygen -A
ADD src/*.sh /opt/
RUN adduser -D -u 5001 user && \
    usermod -G wheel user && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i s/^#PasswordAuthentication.*/PasswordAuthentication\ yes/ /etc/ssh/sshd_config && \
    chmod +x /opt/*.sh

EXPOSE 22

# entrypoint inherited from dind, cmd execs after
ENTRYPOINT ["/opt/startsshd.sh"]

