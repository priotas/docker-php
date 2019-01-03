FROM priotas/docker-php 

RUN apt-get update \
    && apt-get install -y libappindicator3-1 libasound2 libxss1 xdg-utils

RUN cd /tmp \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb

RUN yarn global add selenium-standalone
RUN selenium-standalone install
