# ----------------------------------
# Environment: ubuntu
# Minimum Panel Version: 0.7.X
# ----------------------------------
FROM        mono:6

LABEL       author="Synk star" maintainer="synk@nasulex.net"

RUN         dpkg --add-architecture i386 \
            && useradd -d /home/container -m container \
            && apt update \
            && apt install -y iproute2 ca-certificates unzip sqlite fontconfig lib32gcc1

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
