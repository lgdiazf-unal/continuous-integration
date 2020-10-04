FROM node:12.18-slim
RUN apt-get update
RUN apt-get install sudo
RUN apt-get install nano
RUN passwd -d node
RUN usermod -aG sudo -u 1001 node
USER node
WORKDIR /home/node/src
CMD ["/bin/bash"]
ENV port=3000